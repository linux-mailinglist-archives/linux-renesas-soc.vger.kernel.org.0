Return-Path: <linux-renesas-soc+bounces-23514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF11AC01A96
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 16:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B63013AE57A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7039431AF22;
	Thu, 23 Oct 2025 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pg1y0IDU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8969D2FD69D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227909; cv=none; b=fzferNSZ/CjsZi9HNTJ7VvRVCzf7jpZQjK0Q2MSaSdFR3zHnvJOcVvz26EkbPEMvG2H3Zd6zXo0jdHLVo/7M/X2TkUSBemMZh+Us+FUdLIDDE0Rn7cfSVMMGgUWUb+AebuZTPQSY8UBOHp621lNlMTTVJXD5j093grLEAF/p4EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227909; c=relaxed/simple;
	bh=/jPm6jH+d13noCe9SKn4mrnwnuDsNjdGPU/d9Ul9H6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kjDvk5HOzaxXxP5F3Hc0FS8UHKzysT2c0mWreb3gwjmRz3tNkBtH6mZYJxwW/i23COzAHLQfwBoFbsTpYEA1EW9RF8PyDmw6LWjN8en2bCIuGr6GZIbjKDl0+zSO4/mRWiHOKNarn48KLWX/KPKkFel4rdMaFkl/IyU15bf5UDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pg1y0IDU; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b6d3340dc2aso101252166b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 06:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761227906; x=1761832706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcs7Y+EttDztrEgb0m4AiPh1csnrxylUuqHzrjAxJgY=;
        b=pg1y0IDU42Q63ySQjK8xYqBMTr+J+75fH3VLzWrgauSbvcV1Nm62SDXq8SKumILzks
         WE3K3r/8FdZpx0Tc9Ojiob8wqG1jKbKpPdeleKKo72e+zWH4KQg+nbGkeIxXyg4Xmejm
         tTfGubpGPwBOdLRttoVKOfy4M4iDUcRpeoCYc84Gu3KTyLw/i0pJTzGR3Au60Kn4mDv+
         VfsZUy3nxn4wdcUj2UmU0e4NSKhPvb/vsZdVS+D4ANWNzCdUaF/rsOww/dTyp3Dyx6Yi
         vbnvAD4dLAfavtq6mJJA5chHn7QWiJQB7rvsOmfpixshc01bU5hOZmSVfhene/SNLpCF
         1fPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227906; x=1761832706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcs7Y+EttDztrEgb0m4AiPh1csnrxylUuqHzrjAxJgY=;
        b=j+ufuetff3tjh1WaXFBQqTNgdmk2rca5IObYdhUQvdCr6xHYQylVwn0vDUxHzVUfb/
         tanrItQad4VXeaBlVFCffn5UwOOz+waGhaHlvZRBc4+kuSC31pSeWAJyYQUTZBKTkP/T
         mr8CbR+3JF/qMu3/fO6Y6EqMxSNBhc24/f/23NrV2ZTUCVyhZ1xuPtyRlkvI5mkJI9eG
         QA9lSiiB83rZTEfV+eMY9UYYaLHQpBIP4zVxbinpa3sKQTIhbKzWA/MXRu+/g6+OFi4I
         +tSj31tEez+1L5NO3hXMC7ILk5FE4L1NfzRM+txOtt0mh7M5/g7FgoUmjxhTZpjUDhnb
         ferg==
X-Forwarded-Encrypted: i=1; AJvYcCVv5gJmDUlM+O5elQkCjhEcLsbxMY2aqXIFB5Br+aCEuVsqGWvx4iVNr6a7i1I6hP/I/NL5lvuIXEtyx+bD6hmS1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDi9LtFipFzLqksV0FqsAe1pw9o0D0ccUzznT6ej0TGL7D9zKM
	DIpQ5LfNZJhf0Jwhczmd/ogtbpm6TliD1+sWif2N32Je4UqcmCTK6xt2DECryHjxiFI=
X-Gm-Gg: ASbGncsbARboWOEmnGQNfWhSYbq8XH8Bkqkd6SXFal2oauLiqsqOnimsWoNJeMoBmY/
	GvILyFDm+ta1yq2pUjYK66Nd2QxqQeuJzuYAMbWbnGGrcbSgXz9odGkwcZMP2I6i2Yu6N7UBaTy
	/Hi2yLqn98GtDng4QSmN6uSiiUrKd58hOI8r5YJt8HwFGPmlwPdSK5bzxZ4cg9rI8MxLFEVpPRd
	xZ8b5r3ErX+KscCmRUEnAg/Thued8Ow+wIVN77BgPGVyA5csIxYId4kU+zzV/6CYg4zacGEtub9
	A2B0QiiuYOMd9zkTESYcesClM1bcRXZ4hE2JBolGKvzacrgmDpTQ8D6IhezeVawAJbukfdYEx8N
	CR1s6Kw6AZAqR70lAJ3sx+wodyx7rsIeD6gZ3K7ekwKe5VzZxPUxa7Ktx47glmbGMqErd/L0y/W
	hr8wR/SG4Q2wUU5vwt5R8a/c1UjKXS0AHDaaWF+bF/
X-Google-Smtp-Source: AGHT+IErl4KxFsPoyMcgmYdHQ18H8eQgx+LzGITPImiQSgQDh6xe3/IOiWXni9Y5LKEyJSLxqP3qGQ==
X-Received: by 2002:a17:907:72c4:b0:b29:57b0:617f with SMTP id a640c23a62f3a-b6d2c6df653mr921330166b.1.1761227905751;
        Thu, 23 Oct 2025 06:58:25 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511f8634sm226114066b.29.2025.10.23.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:58:24 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 1/7] dt-bindings: phy: renesas,usb2-phy: Mark resets as required for RZ/G3S
Date: Thu, 23 Oct 2025 16:58:04 +0300
Message-ID: <20251023135810.1688415-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The reset lines are mandatory for the Renesas RZ/G3S platform and must be
explicitly defined in device tree.

Fixes: f3c849855114 ("dt-bindings: phy: renesas,usb2-phy: Document RZ/G3S phy bindings")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v8:
- none

Changes in v7:
- dropped Tb tag as it was reported that it is not valid on bindings

Changes in v6:
- collected tags

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- collected tags
- rebased on top of latest version of renesas,usb2-phy.yaml;
  Conor, Geert: I kept your tags; please let me know if you consider it
  otherwise

Changes in v2:
- none; this patch is new

 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 179cb4bfc424..2bbec8702a1e 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -118,6 +118,7 @@ allOf:
           contains:
             enum:
               - renesas,usb2-phy-r9a09g057
+              - renesas,usb2-phy-r9a08g045
               - renesas,rzg2l-usb2-phy
     then:
       properties:
-- 
2.43.0


