Return-Path: <linux-renesas-soc+bounces-30568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD35CN5Vymn27gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:52:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6322359B2D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1890D30532F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 10:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC8A3C2772;
	Mon, 30 Mar 2026 10:47:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from Atcsqr.andestech.com (exmail.andestech.com [60.248.187.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD14E3C3BFC;
	Mon, 30 Mar 2026 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.187.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867675; cv=none; b=pnnhfv4TqEDHkrLHXAqfc/m4enYg+bEoER9WXvbEQN1sAjfeTk1AqWEBf7wczWyK4ZXQCJ72oE0zTIzgqO0ybF1F7cDFEmr3USkH1uUy6pw0QFvrItmhaLwoL6oK9PKwxV2gutXh+OYXSvDuls8AzhfUhKNHuxyAz5LCzX663kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867675; c=relaxed/simple;
	bh=zrHDITLakLIpn0eicQi7YjWpbVQ6gGg7UH0uPpSZxgI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nMYDvsAKYxgGh4hcAfucuN2kyY4aZ63qcOfBtCztZwf4QBgObersu6pq0WToMbmVZQ0lLcrwdvsRuBLTbGHdTkGsLm7laW1wzYRDReyuVJsZ5ecMjzkqUmJ6gbAOaEpYlHj6TCQUQtunLAHtSQt0+OMWyi1/tBIDC1q9XlKBHT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.187.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 62UASprB039458;
	Mon, 30 Mar 2026 18:28:51 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 62UARlIT038029;
	Mon, 30 Mar 2026 18:27:47 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 18:27:47 +0800
From: Hui Min Mina Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <geert+renesas@glider.be>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <magnus.damm@gmail.com>,
        <ben717@andestech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jonathan.cameron@huawei.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
CC: <tim609@andestech.com>, <alex749@andestech.com>, <az70021@gmail.com>,
        "Hui
 Min Mina Chou" <minachou@andestech.com>
Subject: [PATCH 0/7] refactor Andes cache driver for generic platform support
Date: Mon, 30 Mar 2026 18:27:17 +0800
Message-ID: <20260330102724.1012470-1-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 62UASprB039458
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_REJECT(2.00)[andestech.com : SPF not aligned (relaxed), No valid DKIM,reject];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30568-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,glider.be,bp.renesas.com,gmail.com,andestech.com,huawei.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[andestech.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[andestech.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[minachou@andestech.com,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: B6322359B2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series refactors the Andes cache driver from an AX45MP-specific
implementation to a generic Last Level Cache (LLC) driver that supports
a broader range of Andes CPU cores.

The main motivation is to decouple the driver from AX45MP-specific
naming and assumptions, making it easier to support future Andes
platforms without duplicating code.

Changes in this series:

- Refactor the ax45mp_cache driver into a generic andes_llcache driver,
  introducing support for multiple Andes CPU cores and updating the
  compatible strings accordingly

- Improve initialization by centralizing cache operations

- Improve LLC operation performance by switching to relaxed I/O
  accessors and eliminating unnecessary fence instructions on I/O
  memory, leveraging the platform's point-to-point strongly ordered
  channel guarantee. Also fix hart ID mapping to use
  cpuid_to_hartid_map() for correct behavior in AMP setups

- Centralize cache operations and adopt native WBINVAL support,
  simplifying the cache flush/invalidate path

- Rename DT binding schema from andestech,ax45mp-cache to
  andestech,llcache and update all compatible strings in the RISC-V DTS
  files accordingly

- Add MAINTAINERS entry for the Andes cache driver


Hui Min Mina Chou (7):
  cache: ax45mp_cache: refactor cache driver for generic Andes platform
    support
  cache: andes_llcache: refactor initialization and cache operations
  cache: andes_llcache: improve performance of LLC operation
  cache: andes_llcache: centralize cache ops and use native WBINVAL
  dt-bindings: cache: ax45mp-cache: rename ax45mp-cache to llcache
  dts: riscv: update cache compatible strings to LLC
  MAINTAINERS: Add maintainers for Andes cache driver

 ...ache.yaml => andestech,andes-llcache.yaml} |  20 +-
 MAINTAINERS                                   |   8 +
 arch/riscv/Kconfig.errata                     |   2 +-
 arch/riscv/boot/dts/andes/qilai.dtsi          |   4 +-
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |   2 +-
 drivers/cache/Kconfig                         |   6 +-
 drivers/cache/Makefile                        |   2 +-
 drivers/cache/andes_llcache.c                 | 215 +++++++++++++++++
 drivers/cache/ax45mp_cache.c                  | 217 ------------------
 drivers/soc/renesas/Kconfig                   |   2 +-
 include/linux/soc/andes/csr.h                 |  12 +
 11 files changed, 254 insertions(+), 236 deletions(-)
 rename Documentation/devicetree/bindings/cache/{andestech,ax45mp-cache.yaml => andestech,andes-llcache.yaml} (76%)
 create mode 100644 drivers/cache/andes_llcache.c
 delete mode 100644 drivers/cache/ax45mp_cache.c
 create mode 100644 include/linux/soc/andes/csr.h

-- 
2.34.1


