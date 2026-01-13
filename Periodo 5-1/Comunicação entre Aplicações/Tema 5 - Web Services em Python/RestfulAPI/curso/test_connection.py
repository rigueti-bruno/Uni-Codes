#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys

print("=" * 60)
print("TESTE DE CONEXÃO COM POSTGRESQL")
print("=" * 60)

try:
    print("\n1. Importando módulos...")
    from cursodb import postgresql_engine
    from entidades import Tema
    from sqlalchemy.orm import Session
    print("   ✓ Módulos importados com sucesso")
    
    print("\n2. Tentando conectar ao banco de dados...")
    print(f"   URL de conexão: {postgresql_engine.url}")
    conn = postgresql_engine.connect()
    print("   ✓ Conexão estabelecida!")
    
    print("\n3. Testando query no banco...")
    session = Session(postgresql_engine)
    temas = session.query(Tema).all()
    print(f"   ✓ Query executada! Encontrados {len(temas)} temas")
    
    if temas:
        print("\n4. Temas encontrados:")
        for t in temas:
            print(f"   - {t.tema_id}: {t.tema_nome}")
    else:
        print("\n4. Nenhum tema encontrado no banco (tabela vazia)")
    
    conn.close()
    session.close()
    print("\n" + "=" * 60)
    print("✓ TESTE CONCLUÍDO COM SUCESSO!")
    print("=" * 60)
    
except Exception as e:
    print(f"\n✗ ERRO: {e}")
    print("\n" + "=" * 60)
    print("DETALHES DO ERRO:")
    print("=" * 60)
    import traceback
    traceback.print_exc()
    sys.exit(1)
