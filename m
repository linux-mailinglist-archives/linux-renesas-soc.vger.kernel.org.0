Return-Path: <linux-renesas-soc+bounces-10513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D59C89C7E84
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 23:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63030B22A4E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 22:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2EF18C341;
	Wed, 13 Nov 2024 22:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+brPCa8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D032AE84;
	Wed, 13 Nov 2024 22:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731538702; cv=none; b=s/TzNUkZ/+ouDYGmRLOK4Z8dKGTobJaKz3VTuPq/qKfWC/uXanoeGOSSv0upRxIfFUhSyA6p5aBoj2Ab5asVlZV4/ttuRk50yw+lAEkn1Nz6XmLSCzjoZQVoyLFDFwwR7aMMq9+fNyWpOx5C5oJfldnTMded+2kySN8eVgAtebU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731538702; c=relaxed/simple;
	bh=ULoDJDZ3JdTUBl9n+UmRw4F64UBtMz5cpYhRlaGem5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eZVfUYh5MHPnoy0oVCi92hnlLWL5jZ7JxF4Lc1P0kC/kdmUoaxkzPbEiX9Xw3xXpBP7F7iadoB6kFCIJmCyKDjZH6//bTzPJxYEd6S/ji747bWHO9ZaiRc99a3gIQt9xY/Ui2v941+rymX7hNAtIyopzGxzTD42fRW5AolCAM3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+brPCa8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7A3C4CEC3;
	Wed, 13 Nov 2024 22:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731538701;
	bh=ULoDJDZ3JdTUBl9n+UmRw4F64UBtMz5cpYhRlaGem5Y=;
	h=From:To:Cc:Subject:Date:From;
	b=D+brPCa8XM4btgMQe+0uzf1hgabxOuOmB7M17ZPEXs4kxhLJBu9HcSRZT+lFyfc/s
	 +cloHRvBAqIOSAK6m/K1bZ+U9YhYRjNqzZePIb04cALlkZ10v1Krd8c45u8xT9clOI
	 IJeMvC5Se8soEZ+t6aX3nVc3jbg2gwufzQRhIWL1fa+w8WMae9V3vHPWdwfkepSkyf
	 /nChVWYBfyFBEWdFjHIqIluhSJEzkKoKCnb3GBo+MjDFaQSDgmXhm9h510zlpfPTwZ
	 ia042gFr2AYjFQ2ESX69hBlG0pSOIvdR6xdIDvL/nnvkaMEUNMBAWgIup2c2DAejJv
	 eTRb8BNv9/nbQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] dt-bindings: net: renesas,ether: Drop undocumented "micrel,led-mode"
Date: Wed, 13 Nov 2024 16:57:42 -0600
Message-ID: <20241113225742.1784723-2-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"micrel,led-mode" is not yet documented by a schema. It's irrelevant to
the example, so just drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/renesas,ether.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,ether.yaml b/Documentation/devicetree/bindings/net/renesas,ether.yaml
index 29355ab98569..ced1471c6484 100644
--- a/Documentation/devicetree/bindings/net/renesas,ether.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,ether.yaml
@@ -123,7 +123,6 @@ examples:
             reg = <1>;
             interrupt-parent = <&irqc0>;
             interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-            micrel,led-mode = <1>;
             reset-gpios = <&gpio5 31 GPIO_ACTIVE_LOW>;
         };
     };
-- 
2.45.2


