Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A93F06931DD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 16:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjBKPAj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 10:00:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjBKPAh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 10:00:37 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D1225B86
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 07:00:34 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id bk16so7944921wrb.11
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 07:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYTgBIv1Lfqp43zmmxu2kSou5EHizVXW87AF0Fue5Vk=;
        b=pXOMH1blg6ULBzDg6ieAKS2wFl0yYEm/v3d/OHauyffRGl2zT93WjCdS1/G32G1H4S
         8+2dgXmZWL3s9DLguMzBz8BytceC8ZrbXg8BzcLVxvvK7K/Kr8Bqc4MnPQ2MOxo4kpD7
         N2NmlH9HTh8Ti/lT6+OR3F4v9Ri9oBbptZW86M+72oJ/Lhj4Fqj3cDxnKEpmcSu0e6ZG
         7FRDUvNp6q0q22+rAzlc7OQiigZkp3DeEbd3P6Pvg3QmzogUHa6Bqr2cl2sJPC+U45V0
         /6tkGJsKc52/LoTpJ0mWZA+MnmCfYTzMDZLuglANZBq1LHYGNPH9TH6en1VoM6bX43OQ
         O+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYTgBIv1Lfqp43zmmxu2kSou5EHizVXW87AF0Fue5Vk=;
        b=WZgQLaeCnzi0alsQvTjUXIWMh+6AiyuydFhp45jDyBXHSpNMW4W3MX8iH8nibkqJVH
         YdpjRtdiI43zfo24p8mb/SxzFnDti1VYXqaUYgTg9x97S5qSYjPMRTA4I8KNXwKe4Mga
         TjBlPh3V2oWlGfHMbc6XKKE3nQEhYlepXi4e5Rwlont+vq1YqyZiE36Ki5F7LAioWG4G
         OvfPW2FNltlVevk2caQ12iljKRGE85e8A+pw9asxf2Cu72R3NRdHiZ5Ro4I0i8NIu++k
         jxBhZA6+2udLFx//qoqLb+pMVL0zi/6E8yHzfa8IRUg04C+cKdlE7/xPwZ7iiPSxcBha
         BPOw==
X-Gm-Message-State: AO0yUKU0rfETJpAlHgwba+iNTO7BSkG5p/ELDNGH9N+bdcJAwJV2jvro
        OUIs1vh6dJbGeM8u8DBlicOZ5A==
X-Google-Smtp-Source: AK7set+U39YS8I1DxWWdAnPlUou0GpBcZkh+Gm86FwE8bgRylcoW3cHeJbp36YuCq3X1JBdEiL9/Qw==
X-Received: by 2002:a5d:4912:0:b0:2c5:4ea0:6121 with SMTP id x18-20020a5d4912000000b002c54ea06121mr1719316wrq.26.1676127633004;
        Sat, 11 Feb 2023 07:00:33 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id v5-20020adfe4c5000000b002c549b91c54sm4231415wrm.52.2023.02.11.07.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 07:00:32 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779g0: Add and connect all CSI-2, ISP and VIN nodes
Date:   Sat, 11 Feb 2023 16:00:11 +0100
Message-Id: <20230211150012.3824154-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211150012.3824154-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230211150012.3824154-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The V4H have 16 VIN, 2 CSI-2 and 2 ISP nodes that interact with each
other for video capture. Add all nodes and record how they are
interconnected.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 666 ++++++++++++++++++++++
 1 file changed, 666 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 70eaf7956925..b2c6e05ebae8 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -1155,6 +1155,454 @@ msiof5: spi@e6c28000 {
 			status = "disabled";
 		};
 
+		vin00: video@e6ef0000 {
+			compatible = "renesas,vin-r8a779g0";
+			reg = <0 0xe6ef0000 0 0x1000>;
+			interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 730>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 730>;
+			renesas,id = <0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin00isp0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&isp0vin00>;
+					};
+				};
+			};
+		};
+
+		vin01: video@e6ef1000 {
+			compatible = "renesas,vin-r8a779g0";
+			reg = <0 0xe6ef1000 0 0x1000>;
+			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 731>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 731>;
+			renesas,id = <1>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin01isp0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&isp0vin01>;
+					};
+				};
+			};
+		};
+
+		vin02: video@e6ef2000 {
+			compatible = "renesas,vin-r8a779g0";
+			reg = <0 0xe6ef2000 0 0x1000>;
+			interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 800>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 800>;
+			renesas,id = <2>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin02isp0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&isp0vin02>;
+					};
+				};
+			};
+		};
+
+		vin03: video@e6ef3000 {
+			compatible = "renesas,vin-r8a779g0";
+			reg = <0 0xe6ef3000 0 0x1000>;
+			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 801>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 801>;
+			renesas,id = <3>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin03isp0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&isp0vin03>;
+					};
+				};
+			};
+		};
+
+		vin04: video@e6ef4000 {
+			compatible = "renesas,vin-r8a779g0";
+			reg = <0 0xe6ef4000 0 0x1000>;
+			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 802>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 802>;
+			renesas,id = <4>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin04isp0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&isp0vin04>;
+					};
+				};
+			};
+		};
+
+		vin05: video@e6ef5000 {
+			compatible = "renesas,vin-r8a779g0";
+			reg = <0 0xe6ef5000 0 0x1000>;
+			interrupts = <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 803>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 803>;
+			renesas,id = <5>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin05isp0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&isp0vin05>;
+					};
+				};
+			};
+		};
+
+		vin06: video@e6ef6000 {
+			compatible = "renesas,vin-r8a779g0";
+			reg = <0 0xe6ef6000 0 0x1000>;
+			interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 804>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 804>;
+			renesas,id = <6>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin06isp0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&isp0vin06>;
+					};
+				};
+			};
+		};
+
+		vin07: video@e6ef7000 {
+			compatible = "renesas,vin-r8a779g0";
+			reg = <0 0xe6ef7000 0 0x1000>;
+			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 805>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 805>;
+			renesas,id = <7>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin07isp0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&isp0vin07>;
+					};
+				};
+			};
+		};
+
+		vin08: video@e6ef8000 {
+			compatible = "renesas,vin-r8a779g0";
+			reg = <0 0xe6ef8000 0 0x1000>;
+			interrupts = <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 806>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 806>;
+			renesas,id = <8>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin08isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin08>;
+					};
+				};
+			};
+		};
+
+		vin09: video@e6ef9000 {
+			compatible = "renesas,vin-r8a779g0";
+			reg = <0 0xe6ef9000 0 0x1000>;
+			interrupts = <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 807>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 807>;
+			renesas,id = <9>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin09isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin09>;
+					};
+				};
+			};
+		};
+
+		vin10: video@e6efa000 {
+			compatible = "renesas,vin-r8a779g0";
+			reg = <0 0xe6efa000 0 0x1000>;
+			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 808>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 808>;
+			renesas,id = <10>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin10isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin10>;
+					};
+				};
+			};
+		};
+
+		vin11: video@e6efb000 {
+			compatible = "renesas,vin-r8a779g0";
+			reg = <0 0xe6efb000 0 0x1000>;
+			interrupts = <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 809>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 809>;
+			renesas,id = <11>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin11isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin11>;
+					};
+				};
+			};
+		};
+
+		vin12: video@e6efc000 {
+			compatible = "renesas,vin-r8a779g0";
+			reg = <0 0xe6efc000 0 0x1000>;
+			interrupts = <GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 810>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 810>;
+			renesas,id = <12>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin12isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin12>;
+					};
+				};
+			};
+		};
+
+		vin13: video@e6efd000 {
+			compatible = "renesas,vin-r8a779g0";
+			reg = <0 0xe6efd000 0 0x1000>;
+			interrupts = <GIC_SPI 542 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 811>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 811>;
+			renesas,id = <13>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin13isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin13>;
+					};
+				};
+			};
+		};
+
+		vin14: video@e6efe000 {
+			compatible = "renesas,vin-r8a779g0";
+			reg = <0 0xe6efe000 0 0x1000>;
+			interrupts = <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 812>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 812>;
+			renesas,id = <14>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin14isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin14>;
+					};
+				};
+			};
+		};
+
+		vin15: video@e6eff000 {
+			compatible = "renesas,vin-r8a779g0";
+			reg = <0 0xe6eff000 0 0x1000>;
+			interrupts = <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 813>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 813>;
+			renesas,id = <15>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin15isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin15>;
+					};
+				};
+			};
+		};
+
 		dmac0: dma-controller@e7350000 {
 			compatible = "renesas,dmac-r8a779g0",
 				     "renesas,rcar-gen4-dmac";
@@ -1304,6 +1752,58 @@ vspd1: vsp@fea28000 {
 			renesas,fcp = <&fcpvd1>;
 		};
 
+		csi40: csi2@fe500000 {
+			compatible = "renesas,r8a779g0-csi2";
+			reg = <0 0xfe500000 0 0x40000>;
+			interrupts = <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 331>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 331>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+					csi40isp0: endpoint {
+						remote-endpoint = <&isp0csi40>;
+					};
+				};
+			};
+		};
+
+		csi41: csi2@fe540000 {
+			compatible = "renesas,r8a779g0-csi2";
+			reg = <0 0xfe540000 0 0x40000>;
+			interrupts = <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 400>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 400>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+					csi41isp1: endpoint {
+						remote-endpoint = <&isp1csi41>;
+					};
+				};
+			};
+		};
+
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a779g0";
 			reg = <0 0xfeb00000 0 0x40000>;
@@ -1338,6 +1838,172 @@ du_out_dsi1: endpoint {
 			};
 		};
 
+		isp0: isp@fed00000 {
+			compatible = "renesas,r8a779g0-isp";
+			reg = <0 0xfed00000 0 0x10000>;
+			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&cpg CPG_MOD 612>;
+			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
+			resets = <&cpg 612>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <0>;
+
+					isp0csi40: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&csi40isp0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					isp0vin00: endpoint {
+						remote-endpoint = <&vin00isp0>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					isp0vin01: endpoint {
+						remote-endpoint = <&vin01isp0>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					isp0vin02: endpoint {
+						remote-endpoint = <&vin02isp0>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+					isp0vin03: endpoint {
+						remote-endpoint = <&vin03isp0>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					isp0vin04: endpoint {
+						remote-endpoint = <&vin04isp0>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+					isp0vin05: endpoint {
+						remote-endpoint = <&vin05isp0>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+					isp0vin06: endpoint {
+						remote-endpoint = <&vin06isp0>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+					isp0vin07: endpoint {
+						remote-endpoint = <&vin07isp0>;
+					};
+				};
+			};
+		};
+
+		isp1: isp@fed20000 {
+			compatible = "renesas,r8a779g0-isp";
+			reg = <0 0xfed20000 0 0x10000>;
+			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&cpg CPG_MOD 613>;
+			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
+			resets = <&cpg 613>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <0>;
+
+					isp1csi41: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&csi41isp1>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					isp1vin08: endpoint {
+						remote-endpoint = <&vin08isp1>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					isp1vin09: endpoint {
+						remote-endpoint = <&vin09isp1>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					isp1vin10: endpoint {
+						remote-endpoint = <&vin10isp1>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+					isp1vin11: endpoint {
+						remote-endpoint = <&vin11isp1>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					isp1vin12: endpoint {
+						remote-endpoint = <&vin12isp1>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+					isp1vin13: endpoint {
+						remote-endpoint = <&vin13isp1>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+					isp1vin14: endpoint {
+						remote-endpoint = <&vin14isp1>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+					isp1vin15: endpoint {
+						remote-endpoint = <&vin15isp1>;
+					};
+				};
+			};
+		};
+
 		dsi0: dsi-encoder@fed80000 {
 			compatible = "renesas,r8a779g0-dsi-csi2-tx";
 			reg = <0 0xfed80000 0 0x10000>;
-- 
2.39.1

