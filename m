Return-Path: <linux-renesas-soc+bounces-3683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED96A87816D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 15:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F85D1F24007
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 14:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A7E405DB;
	Mon, 11 Mar 2024 14:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Yy9Ijr4b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CE73FE3D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2024 14:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710166354; cv=none; b=KxdprpbcUT6NmW6dTqrMpWY6vAWKAA8Ct9aNumZ3ztPi6p43bYtPM704nEAqhGSv1la85cHCe8VEp0x0oixnDwQWSjL5cepaOVTO4Gp8cKL2ifyTgcVZDBVmFza2eXDQ4ep0ZCf9UO5sZUxtq8eeTLx0umDCKrZVkCyz58HEXrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710166354; c=relaxed/simple;
	bh=/HGzTB5SZdVO3xOHO21xQHKVoBA4t5yAIwbItVhKxeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UIWjy6DPjmV7NSutM63UPxzHKSoZkvG3m18Lc1mZhb0J4JSOYKBZTY8oX5Ux3EaBgdocFAk2JO2H7MsP8nMcBnwdXCDPwemfAWeCmeo2Piq1oT+MERuAOdL1k4MoObzxVakqpOyfINDD7B20urNS9x6ZbSlqToPl4+aQ0VqYZmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Yy9Ijr4b; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a450615d1c4so754422666b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2024 07:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1710166350; x=1710771150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBanA23QROE3/+jLFGt6yRe0SQoJ2oxKoX4eGPxFzrw=;
        b=Yy9Ijr4bZImVsPWjUXnztvNB/wqKf7ZtGMd6DlRUuxmxn9FpChWfGR5HWJwSRBoPJX
         U3N8uNFrXNl8nX/j8YT8vbYe3l4icX7f3pJZgFilMdor9B/gm9QaGnFS68zAV6XQryVf
         vU9UlMkn6yQN9B+lL83EIOvTgV3XkQ0qHWTeO/Ha4uz0ACIqyIb3BEky3X5J5fCHz9qb
         EMm8Q68WvJA83kTWrfojb2PDQgajuUWnMKUby+3K5rPZE02lS1gh7HrqLINcGQCf690x
         fcaiMb4QWGVPRc5iLVj/p8gUg3FEG9hlKpxgrMgEQj1VNJjXZkCBL/4iEAhi7u0qE0DB
         13ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710166350; x=1710771150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBanA23QROE3/+jLFGt6yRe0SQoJ2oxKoX4eGPxFzrw=;
        b=eoylLxz+Gh6sRoKIpsRFeWQe2hu7D/5q8KJlQYYOsnLhRrWAAxgCUPLEJ6FhbeWHbv
         tpwH/jaAo8rauG6z0+W11VxNkVaBDFb18MifItzX12FrvOX9dIEK1ZLL6Mf6qAUPSq0q
         oc3a79NiUVJcj+FDAkNz/YI2HhBC8hSW6916sCQn1c/Y8sG0Xmw+GbPosMxPTmnIlhcu
         JzWJUDIYq0ydibsMQI5bHfShh7SJCUeJyeWCdMSmKGBUVBdFJ2gVnFyDlP3+3hTHVI6C
         eTeaiUvh7BVCIkR9K7UMChZvRnIJXM95khbT8Ssl2ZEaiRSv2Jf2ytoH/z1PJ5VoykbD
         uGBQ==
X-Gm-Message-State: AOJu0Yxua0cgsgKQM9C7mXNanwQ6SCMmnvKCohfwmOqXBDjy8WB3VO6f
	6Zf1UEH0wgFQL/nAa7wW2Y8MXNDJp1O5FAJZ6WRN12XN3lILp0IvimHeigro8KI=
X-Google-Smtp-Source: AGHT+IFpaFYHZPUC59+vr6YEUbUDIfvHm0t6MBKRtc2HkOlRmTHV+gZO+re4EWKsdiZyVhlhk5GFtg==
X-Received: by 2002:a17:906:6cc:b0:a46:2a8a:63fb with SMTP id v12-20020a17090606cc00b00a462a8a63fbmr2167752ejb.26.1710166349926;
        Mon, 11 Mar 2024 07:12:29 -0700 (PDT)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id kn11-20020a170906aa4b00b00a45efdfdd1esm2863154ejb.40.2024.03.11.07.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 07:12:29 -0700 (PDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next,v3 1/2] dt-bindings: net: renesas,etheravb: Add optional MDIO bus node
Date: Mon, 11 Mar 2024 15:11:05 +0100
Message-ID: <20240311141106.3200743-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240311141106.3200743-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240311141106.3200743-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Renesas Ethernet AVB bindings do not allow the MDIO bus to be
described. This has not been needed as only a single PHY is
supported and no MDIO bus properties have been needed.

Add an optional mdio node to the binding which allows the MDIO bus to be
described and allow bus properties to be set.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
* Changes since v2
- Mark the PHY pattern as deprecated and add a comment that new bindings
  should describe the PHY inside the MDIO node.
---
 .../devicetree/bindings/net/renesas,etheravb.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
index de7ba7f345a9..8bfd4fb5f834 100644
--- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
@@ -93,6 +93,10 @@ properties:
     description: Number of size cells on the MDIO bus.
     const: 0
 
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+    unevaluatedProperties: false
+
   renesas,no-ether-link:
     type: boolean
     description:
@@ -110,9 +114,13 @@ properties:
   tx-internal-delay-ps:
     enum: [0, 2000]
 
+# In older bindings there where no mdio child-node to describe the MDIO bus
+# and the PHY. To not fail older bindings accept any node with an address. New
+# users should describe the PHY inside the mdio child-node.
 patternProperties:
   "@[0-9a-f]$":
     type: object
+    deprecated: true
 
 required:
   - compatible
-- 
2.44.0


