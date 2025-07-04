Return-Path: <linux-renesas-soc+bounces-19234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4341AF97B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 18:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1426540276
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 16:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2E0327A36;
	Fri,  4 Jul 2025 16:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nJ7qrkuQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3DD32719F
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Jul 2025 16:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645684; cv=none; b=SYre8CGNy7z1JyBQU61C5sAKac5bunWcLV5786mGYPAMTUI2OC7cMIjI7wJsFVmy3u0oIV7ZLXAQ/+9cS7YR1xL8B2XFnN8oalpAT+zY9DAwiLddnJHuUofFH6x045Bfn1mPcVBEwI6SjC6mqSjr00GQSvbYKH/chtkX2kNnUE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645684; c=relaxed/simple;
	bh=8qyZx+ACiY0+WBNIGME8B9wVL18PEIEvpUnFL2L5JlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oTIaXcIQCY3MyjBrTXmqDWRndSgHihxHo85v3nxufB7rx6GtD31WxA79LquC6tAzCiJEWShfpBWnw7eqj8hM4zNpbT/O/cmsA0HIamXJIu3EGvLCaeE+rIdHGDja5sIfPj5BmcOIUaHqvadJDlpeyc4vU1AQj04Mn4pTow53bog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nJ7qrkuQ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a16e5so1952938a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jul 2025 09:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645681; x=1752250481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDcC8N9ecRYf9VHdU9K0Q9wS+bIYi9ixK/h1xf/HBCM=;
        b=nJ7qrkuQ8JGmwc8qNezgio1TfFxtRIvONYqndX+NCODLX4GTTS8CaZMDPWpKIYYdtA
         krjNtqYKeIQV0ePeCpxEdZeT3VWsdzT5QGy7yukNOBi4ueOiaFaEoRHPBmFN0nHk2cvb
         00MDsyniuVi6HcWZZjWddUudt9qSHfDRBZ6Qc8FiBWvLUhJ4VKjHNc77imjyyiah5RHZ
         8wGzo2+y9s3WRxTL3dAD5Re4a5IjndKeev/vQZ+NDfy6ES5cvOPlpfecFgbGfnhFoNV5
         TmVUe2+5tKarak4W/VQR/+8gFPA3mnsBf3VNSWQ6KtT9NOANRN5bJE7+xvJSvF4T2uyc
         1yBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645681; x=1752250481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDcC8N9ecRYf9VHdU9K0Q9wS+bIYi9ixK/h1xf/HBCM=;
        b=WF5GZlY4xrWqttBJGZpMCW6gTRICDALJhEZzn4BAqSRRpBGChpUNknBfaLi+gGp5Za
         5PkQlO/SSFsHUIyNFBbPV3K2GMgzL8CZ9CA7Q0CyC/Z+k7pemrZxANuSnwmWXle8hXkE
         xNYT36gzc8Q17e2qXsYfS0fewR8MYhvKOVsv132naIlY8jqHUPonl71fsu0+jFZmch0g
         GsYUC6pIXOuHC4qP6Hh/MlB2oHcK3JiK4CUmAf4JQJaZvE2tOAq3hcWnzCtzF6K/H8EP
         fiv4KnWP0uLvEa3AVgc1qoGTgSjhlT62xpBCNqgLPYakuMZRx/tDlUJ3NGMugPFJKxB/
         rqRA==
X-Forwarded-Encrypted: i=1; AJvYcCUyjWngyg3pqww9agcZppKq3wI0fDrd/A8gB/aCMhNqa8wYGFVLAIi5+5VuLknYWIzOl/tg1jDhxvEeBrfMgLQPvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfVzZwsgQzQlisEqSyg7/7tvlVac53ZZe5bPv7hf4lMYrdSfiI
	AQm5CrvvS1YGKhYXtdDyug4SF0Ivq3RjyLwnTSFnrpcBcZXA7UpsMmtqmyUTwpcB4C0=
X-Gm-Gg: ASbGncvluvV2khtzpYmneiDduJuxciiCDLj3S0Czaul9tNDZJ6jr+woTHWP8R+RhmQV
	Z5jYEEWGuV29arpoa426MTMc6n4koDYNbtg74AsHoSWYbI8Swh5VnjkHOzNuW72DMztm2E9YUjc
	UnGARvLeA+LaD5PSg3T+3aRxzyYq8JxmWEFtmZH0yhNUZYyClCRgHG692BUHuzXyn2f4GTtzMGH
	1PDEY8MhZQdXgfyjDGSYAUruFnutoxFfwzMuVNscas2zZoBVjOrwqJnnJA9H1Q7lyZQWh3PA6q5
	WU2vK/Aohe9xAwCK+8agJKLCVaWbb8u8o9VNbFqgms/rE5MnHst+a06jlXkGlWs4Eff1pDnr3tU
	JBBGw1BEozBzdU08=
X-Google-Smtp-Source: AGHT+IGL1FhLD4OaydMHDQRErBXQVTMo3OYnTq5XD1D0AoTOZG1fs0lJwUIPUfaPAE25gc/Ra0hNDQ==
X-Received: by 2002:a17:907:dab:b0:ae0:c0b3:5656 with SMTP id a640c23a62f3a-ae3fbc6509bmr348476466b.22.1751645680835;
        Fri, 04 Jul 2025 09:14:40 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:40 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 3/9] PCI: of_property: Restore the arguments of the next level parent
Date: Fri,  4 Jul 2025 19:14:03 +0300
Message-ID: <20250704161410.3931884-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

of_pci_make_dev_node() creates a device tree node for the PCIe bridge it
detects. The node name follows the format: pci_type@pci_slot,pci_func. If
such a node already exists in the current device tree, a new one is not
created.

When the node is created, its contents are populated with information from
the parent node. In the case of root complex nodes described in the device
tree, the created node duplicates the interrupt-map property. However, the
duplicated interrupt-map property does not correctly point to the next
interrupt controller.

For example, in the case of the Renesas RZ/G3S SoC, the resulting device
tree node is as follows (only relevant DT properties are shown):

pcie@11e40000 {

    // ...

    interrupt-map = <0x00 0x00 0x00 0x01 0x1f 0x00 0x00 0x00 0x00
                     0x00 0x00 0x00 0x02 0x1f 0x00 0x00 0x00 0x01
                     0x00 0x00 0x00 0x03 0x1f 0x00 0x00 0x00 0x02
                     0x00 0x00 0x00 0x04 0x1f 0x00 0x00 0x00 0x03>;
    interrupt-map-mask = <0x00 0x00 0x00 0x07>;
    interrupt-controller;
    #interrupt-cells = <0x01>;

    #address-cells = <0x03>;
    #size-cells = <0x02>;

    phandle = <0x1f>;

    // ...

    pci@0,0 {
        reg = <0x00 0x00 0x00 0x00 0x00>;
        interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x00
                         0x10000 0x00 0x00 0x02 0x1f 0x00 0x11e40000 0x00 0x01
                         0x10000 0x00 0x00 0x03 0x1f 0x00 0x11e40000 0x00 0x02
                         0x10000 0x00 0x00 0x04 0x1f 0x00 0x11e40000 0x00 0x03>;
        interrupt-map-mask = <0xffff00 0x00 0x00 0x07>;
        #interrupt-cells = <0x01>;

        #address-cells = <0x03>;
        #size-cells = <0x02>;

        // ...
    };
};

With this pci@0,0 node, the interrupt-map parsing code behaves as follows:

When a PCIe endpoint is enumerated and it requests to map a legacy
interrupt, of_irq_parse_raw() is called requesting the interrupt from
pci@0,0. If INTA is requested, of_irq_parse_raw() first matches:

interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x00>

from the pci@0,0 node. It then follows the phandle 0x1f to the interrupt
parent, looking for a mapping for interrupt ID 0x00
(0x00 0x11e40000 0x00 0x00). However, the root complex node does not
provide this mapping in its interrupt-map property, causing the interrupt
request to fail.

To avoid this, in the interrupt-map property of the nodes generated by
of_pci_make_dev_node() map legacy interrupts to entries that are valid in
the next level interrupt controller in the interrupt mapping tree.

With this, the generated pci@0,0 node and its parent look as follows:

pcie@11e40000 {
    // ...

    interrupt-map = <0x00 0x00 0x00 0x01 0x1f 0x00 0x00 0x00 0x00
                     0x00 0x00 0x00 0x02 0x1f 0x00 0x00 0x00 0x01
                     0x00 0x00 0x00 0x03 0x1f 0x00 0x00 0x00 0x02
                     0x00 0x00 0x00 0x04 0x1f 0x00 0x00 0x00 0x03>;
    interrupt-map-mask = <0x00 0x00 0x00 0x07>;
    interrupt-controller;
    #interrupt-cells = <0x01>;

    #address-cells = <0x03>;
    #size-cells = <0x02>;

    phandle = <0x1f>;

    // ...

    pci@0,0 {
        reg = <0x00 0x00 0x00 0x00 0x00>;
        interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x01
                         0x10000 0x00 0x00 0x02 0x1f 0x00 0x11e40000 0x00 0x02
                         0x10000 0x00 0x00 0x03 0x1f 0x00 0x11e40000 0x00 0x03
                         0x10000 0x00 0x00 0x04 0x1f 0x00 0x11e40000 0x00 0x04>;
        interrupt-map-mask = <0xffff00 0x00 0x00 0x07>;
        #interrupt-cells = <0x01>;

        #address-cells = <0x03>;
        #size-cells = <0x02>;
    };
};

Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none; this patch is new

 drivers/pci/of_property.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 506fcd507113..8dfed096326f 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -243,6 +243,14 @@ static int of_pci_prop_intr_map(struct pci_dev *pdev, struct of_changeset *ocs,
 		}
 		of_property_read_u32(out_irq[i].np, "#address-cells",
 				     &addr_sz[i]);
+
+		/*
+		 * Restore the arguments of the next level parent if a map
+		 * was found.
+		 */
+		out_irq[i].np = pnode;
+		out_irq[i].args_count = 1;
+		out_irq[i].args[0] = pin;
 	}
 
 	list_for_each_entry(child, &pdev->subordinate->devices, bus_list) {
-- 
2.43.0


