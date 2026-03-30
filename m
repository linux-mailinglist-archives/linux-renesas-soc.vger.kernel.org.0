Return-Path: <linux-renesas-soc+bounces-30573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP92MJ1Yymn27gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 13:03:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE854359E2F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 13:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 363C1306F4CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 10:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64B53BADBA;
	Mon, 30 Mar 2026 10:48:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from Atcsqr.andestech.com (unknown [60.248.187.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A103C5531;
	Mon, 30 Mar 2026 10:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.187.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867708; cv=none; b=RFfic8xzoVLCv780yZwIVzsuaTOX0GpN0Jdyv3WmVrfTWrOD8g+802esZVgsk3DfrgNCEhPJUbbRwseu+xOXc9X9q9RrPF+ITjn/YGOA0L3NlxXs+uduQ7xuj8qFL8OV1zV6Ibx54HYQCr7emZ+rddubtgDdSOqp4SPq0l4v2Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867708; c=relaxed/simple;
	bh=VbCZEiqH70J7vlJW75wZQYTsamVjQ6zwAHkOmcwBm1U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EHA1VMzTvxaJ7KTpwS8xKzh/TXTagbnNG5/Dj9+rYzMqud0SLLX0Juf74/UjeN6/8Dp9lrfpaNWZE0IpJIipU1SfPL0VbgT/xpw/x2e8Q/US1/Vy63a8mwIaZXPxq0UqX+5KpCeqJpVohhmkVfhGVB4rcH9mf4V18Gfda/d2KVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.187.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 62UATOXY040303;
	Mon, 30 Mar 2026 18:29:24 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 62UASKjA038311;
	Mon, 30 Mar 2026 18:28:20 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 18:28:20 +0800
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
Subject: [PATCH 7/7] MAINTAINERS: Add maintainers for Andes cache driver
Date: Mon, 30 Mar 2026 18:27:24 +0800
Message-ID: <20260330102724.1012470-8-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330102724.1012470-1-minachou@andestech.com>
References: <20260330102724.1012470-1-minachou@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 62UATOXY040303
X-Spamd-Result: default: False [3.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[andestech.com : SPF not aligned (relaxed), No valid DKIM,reject];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30573-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,glider.be,bp.renesas.com,gmail.com,andestech.com,huawei.com,vger.kernel.org,lists.infradead.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[andestech.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[minachou@andestech.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[andestech.com:email,andestech.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:email,android.com:email]
X-Rspamd-Queue-Id: BE854359E2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Here add maintainer information for Andes cache driver.

Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 23d88c825175..e95efbcd6d39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1863,6 +1863,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/spi/andestech,ae350-spi.yaml
 F:	drivers/spi/spi-atcspi200.c
 
+ANDES CACHE DRIVER
+M:	Alex Chun-Ju Lin <alex749@andestech.com>
+M:	Leo Yu-Chi Liang <ycliang@andestech.com>
+M:	Mina Hui Min Chou <minachou@andestech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/cache/andestech,andes-llcache.yaml
+F:	drivers/cache/andes_llcache.c
+
 ANDROID DRIVERS
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 M:	Arve Hjønnevåg <arve@android.com>
-- 
2.34.1


