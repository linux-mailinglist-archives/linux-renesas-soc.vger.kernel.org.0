Return-Path: <linux-renesas-soc+bounces-28496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Hj8FwBuoGk3jgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 17:00:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 207051A95B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 16:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E53C632EF462
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 15:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4835440B6F9;
	Thu, 26 Feb 2026 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gXYwsLqm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7073F3D6470
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 15:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120380; cv=pass; b=ArfbfvOWHrHgyYy+AHCm4TywwJxzP6K6FytUD7G25lBHOszcl9g6NwRNjhnKtY7IVSFgv74KgQM8dxVzfTemf+SiqdvhUjJckkAqYhYXmyFSCBxUQ5UYlnVx1YPGloe7Dv0SIHvnF38XF7Sjqipn8jrfK/S91nrY+1hQmA5uV6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120380; c=relaxed/simple;
	bh=8xptqJuqr6y/XZ8cnubujeOx86XkzhzmPx/rVf1SSn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JdAHFdLaeA/D1SVPgRyLZJzkz4DgTdsc1HHVcz7xoLfdmrxs+gDlxLL2+jb9YvYeXI/gOHeb/Ed7vcMOxP7VbZKNUBIrt0UUwm+69Hq/bEVTG01EhY1b6iVVVmmRPFRGd+aneLcJF6AYoLX13aCmzlgiYCuDn7lVlGdlbLtQ/TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=gXYwsLqm; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=EG/8db4PuO6Ccr1+6/OtMXqyxNl4kd3+f1XyzIZeMRg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772120360;
 b=U7aOj6VsIRbm9ZV4+fiCQHQDHGqn4c+gWhumHODdT56vhpc8XuKyH/UvqVH0HKVN5CRvWwzR
 YUSHYK7r/mx0hCNq722IQz5tx8VbVQylAbjbokda2NcteO9gvhvWSYM9R3oQ22qsynv+5cLl9B0
 Ekdhapd2/vpEuyQc6jsBSUwJ5CaZH6V62ZJHhWQLDPBXGmAcIbZTEbqINdWUdoI4EdQ0D4ptk2S
 vdIrYosdb4ggOhJMLtyECEa3XiqWrgE0qmSzIwWwp7KeL+jhKg2GOmGqyqt9wLCh0Tj1qcqDsea
 V5iI7BjJv4shZ6P5YPVh/RTfS4oYCH0Q9cfB47yhp4ejg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772120360;
 b=YbWutzGCCEYVmdtalyPLxy8/aKo90LVj4jFTZGek4aYiZ7XXtLpGa59+WP7GxgdSBt6dsAWJ
 QB1jnLBhuiuyQh9wjgc8DuK1VH0JMauqEEB6SedE8U13NOUBl7AaBX+Y/RZ1IiU5/o1EGfTzL2L
 /FY9Gjcl7L6fsBP05DmMeyHdGNqtbJmz4OQP5aDs4Y/LeAsll22Hn+ZJb60L+FNRQ7FdZfGw6j9
 rBNBkIjrmSBTzBwVRXk/6oV/uNl115Zqz4TJNGWplse4gJ11w3JcS5ZNZDKUNYoAq3vcneuJpOA
 v3MoSWtNlgM+1iX+W51tVEuL2c5klyAqTpOHIGdM5aBWw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 26 Feb 2026 16:39:20 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id B4D43A40F28;
	Thu, 26 Feb 2026 16:39:02 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v3 1/5] dt-bindings: usb: cdns,usb3: support USB devices in DT
Date: Thu, 26 Feb 2026 16:38:50 +0100
Message-ID: <20260226153859.665901-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
References: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-renesas-soc@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4fMFxN1L01z2nGBP
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:99766f1dadc9c0fd76839a32754897e4
X-cloud-security:scantime:1.750
DKIM-Signature: a=rsa-sha256;
 bh=EG/8db4PuO6Ccr1+6/OtMXqyxNl4kd3+f1XyzIZeMRg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772120360; v=1;
 b=gXYwsLqmGzu0XZGUr1VNLcX16BEGqgXwxZoXt8TFGngw3cbfYP6Es9NkZeojIVcCZxOFKexF
 WSpelaObF+T/nzXYae6oWN1jjXZ0YV5aBcNCtRmXykoH//tPhp44NK+UEiVmrosq5suqnoD3a0S
 SHRiCJQCHUgG7EwZSNbTnwp+6QdFlmiHgtzQa/TAzgPj3UWyNUW34BuPoxXiPL2HNSuGt+IbOkS
 7Lhbe2Q3pHVJja7SoxbpDkY/dSUS7EMTYpiCXS/FHrAfCmPei+L3we2y+OeVZbVKxnzTrB5tyFe
 PtvrmjZRVXsF2zK9p4eG/T4bs5RR3BPF2GVZu0FG2W7vg==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=hse1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,baylibre.com,cadence.com,linuxfoundation.org,pengutronix.de,gmail.com,denx.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28496-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ew.tq-group.com:mid,ew.tq-group.com:dkim,tq-group.com:email]
X-Rspamd-Queue-Id: 207051A95B7
X-Rspamd-Action: no action

Reference usb-xhci.yaml in host mode in order to support on-board USB
hubs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Fix commit message typo

 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index f454ddd9bbaa6..a199e5ba64161 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -85,6 +85,7 @@ required:
 
 allOf:
   - $ref: usb-drd.yaml#
+  - $ref: usb-xhci.yaml#
 
 unevaluatedProperties: false
 
-- 
2.43.0


