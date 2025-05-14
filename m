Return-Path: <linux-renesas-soc+bounces-17099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9755FAB6A90
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 13:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BB8B8C2231
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 11:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1128E274653;
	Wed, 14 May 2025 11:52:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB39275108
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747223562; cv=none; b=qD8pkOkVRG1Fb5GKlLEGj/y7daYRPgubhM5S62vmw3HSkdmLFhqAaDwYcZmWjzDLQgBIBKovAFIB5AV8o72zaSE43tMZMWHpjqu+jgKSvvK+b7ApVDgr/zniIFmGUl2Q6oRp6PK8mIjzFCSGop85XJ5Lro1ZDjkY63TDJavimYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747223562; c=relaxed/simple;
	bh=GyPyttQ5snqAFktZDiOrr3OO1jDbw21lGT792L8fP/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S+OLk1m+qLbc3STNfiSTPPKxhGTxQ5z0K6nvlHjmskaXDzyaxuUCeXUQMIAkPMVl+XH5Q0fexuEHSeH+o1+jLwThDTCDcqtp1R+nVi/8zv8NnywwXzgxEVKx4SlXo+T+pfLc2EnNL8P9wxuYw8zmH5rTG2WX51zzEJOwTZbh3nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4ZyBL65HKlz4wwkR
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 13:43:10 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b73:c707:6969:f5d6])
	by laurent.telenet-ops.be with cmsmtp
	id ozj22E0060UrTfo01zj2eU; Wed, 14 May 2025 13:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFAVf-00000001g4i-1OUU;
	Wed, 14 May 2025 13:43:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFAVq-00000000hzg-0GKB;
	Wed, 14 May 2025 13:43:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: soc: renesas: Document RZ/V2H EVK board part number
Date: Wed, 14 May 2025 13:42:50 +0200
Message-ID: <0a264c102c615e0a1bec2e45cba180298643520c.1747222771.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.17.

v2:
  - Update part number to actual upstreamed board revision.
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 5e6e6e6208dc552e..f074b5c35c6f7d19 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -576,7 +576,7 @@ properties:
       - description: RZ/V2H(P) (R9A09G057)
         items:
           - enum:
-              - renesas,rzv2h-evk # RZ/V2H EVK
+              - renesas,rzv2h-evk # RZ/V2H EVK (RTK0EF0168C06001BJ)
           - enum:
               - renesas,r9a09g057h41 # RZ/V2H
               - renesas,r9a09g057h42 # RZ/V2H with Mali-G31 support
-- 
2.43.0


