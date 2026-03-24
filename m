Return-Path: <linux-renesas-soc+bounces-30146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ8NIeFawmnQbwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 10:35:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C8B305AA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 10:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C711B3095364
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 09:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBAD388E5F;
	Tue, 24 Mar 2026 09:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TTlaY5lB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF92338239E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344238; cv=none; b=l/jIVATtHUDWF03JPMUqMXwjVYQlDst3nBxmyKAJs4vgtVZdZxW2Vn5Mi81/PxqTOgFTZAow+ZbdNrMfClt/mbqRQmYOnprcN7mdwSi4+KbJSv1p6rkU2415zHejaVqyJtEzbi1H7okuNLEvIMkAQwU517D3BgmjnlYLEkKsUKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344238; c=relaxed/simple;
	bh=eORHv6uMOxEZQvZKT0NGFZMJsp3s4BCbYLo0O/D16Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=l0p8+xtzHHhvEJ3fiYnm1rBtEain7aybV2Qpfax3O+8uH8t0Q4mnco3exycpye6zn21z0vxqqBHWQ13GZDVdhuk0R8KNeDsBboEQEhCXFQumo6TvfQHEVFAlgqxFDwmk1lx3aT0Laawxr3N/Fq5XzxRgQE9lJloGIg/9sLRw7yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TTlaY5lB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so35437725e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 02:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774344226; x=1774949026; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5BTS4Xu7BcfhUbuvKmb6N+eqgb+/BungbccHaCogJs=;
        b=TTlaY5lBI780CEmaF4G6s2ABEbZEWSzZ1EONPBx3jInjBgAa4HB+O5DJRlJ5WTAv3g
         Qbewwz2/QM8/eLhZJMCr74z5dvRLdP/VBFKby9XZr1X2UsBOG+hkLeVvxjqAZ4wLLoC5
         gPhHmj6MQdNo2IEUabVpFaqKum3i+bPb+/KXRq+xikZAmO7MWXExUU/PkDnJZdwNc23h
         b/1f4a2QhDt27syw9Wc5FdCL2/gKPbPgaJWgoIgD8YvNqPIE0f1/lkgSt1XOA3TPEQ8Q
         K4YVcZQelrVd9Zrzg/7yyICI4YjzFW8aXg98pKmlGX0X2TXcQw+L5les5r7NZk1EIccm
         t/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774344226; x=1774949026;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5BTS4Xu7BcfhUbuvKmb6N+eqgb+/BungbccHaCogJs=;
        b=J64f7K2IYZrJgWq2D1FVOSm+Fjq0nUClg2eJW2HeXXJ+OGLPf2psuxwWdTV7iU2/qU
         zwvvr/VTZxd7rKnFGP0tQpMixhZfoUwEvrVFex0GiISj848wUQgdzrKYH5vGdICXsu1t
         /zu3b8Yg+2f69X1W2OOloH6iBrDXxVyQALuff3IvLQaLJSIpv/A7D4itpXRqohtDrsaK
         3q4D90f+PZzli/pkVi+86cLjSOCtES8fWwv8Q8/HCZFcZadVR6T60VZ4RJzTwEwt7iNg
         6QI4vwLYlZQbmwyjgyETeW6+sA8vPMvBedjq+MniEgtqRWWk4xAHnScvs98YRi1lhZFR
         g+nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB9BkmLk3oYBjI9CbPw9zH6q55Epk9Rt2RRhv4mW7ZJshQf8OWt03xgWmZ4S1In80/JpDV6upVnxmXBwhKBGvprQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmOj27lsV2Jv0KG9ShNCZu2nTiS4/SPPBHdwTcgEl9tHBDBpvs
	ylQtb81xQhxFxUKW5Us54nbd3AThr+DJPiFBFsTvN6Wm4sW1jAAvzxzIbsmuEeCRE6k=
X-Gm-Gg: ATEYQzxfKB2fJZRaLO0MXzA9Di6YBfcRox4HPHIQkIanFd4KCnDbPEP+4/V/j+lkNha
	N6EQviK/H2TPQFoBHhYI+TTtnO87UmX1BSdhtolkg7sDmamSGAG8alA8bW1tliOsrbTnGlbwfuU
	TfukayWKt/TqSoVR+JQu8uI7eB5oyhVKfaDq0mj3flg8v30RxLvZMP/Ndj2WK/QBbvwMKh7m+Cv
	m/bgl3kzoDE9WD1B95M95chJ/YOG4KbUaB4RUnSv0+xts8eVbvfZWbIj8IzOCZhrOYljy+Cc+4D
	PEmHOa3gtGeiXfTzkrc5f7gEr9KU3Wvo/7ONqQbxf0FJKn/Hw5FzQSGhukEs6n2OSWqNcBtGM5P
	d1GIrB07rZtu05X+S0gcU1rlE+/P4D2juEgdOOuwV7t5rNCCWXhcaqL1ZNH16v3ZFf/ZoxCXpYz
	lXfaKk7q4rQ5Ipv3pfYiTmFWD1BnBBhES8Wb2XxFm+i2ZG
X-Received: by 2002:a05:600c:a596:b0:486:ffa3:594 with SMTP id 5b1f17b1804b1-486ffa30b0amr132702615e9.23.1774344225686;
        Tue, 24 Mar 2026 02:23:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c44bfsm41808585e9.9.2026.03.24.02.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 02:23:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Mar 2026 10:23:22 +0100
Subject: [PATCH v2] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v2-1-b86a1543b76b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAlYwmkC/53NQQ6DIBCF4asY1p0GEIntqvdoXKAMOmkLBKypM
 d691CN0+b/F+zaWMRFmdq02lnChTMGXkKeKDZPxIwLZ0kxyqXktLjCHSAPkV6sbDmY1HgPEMDx
 whizhHS305C35MUNdi15qq1zvNCuHMaGjz4Hdu9IT5Tmk9bAX8Vv/YhYBAlqFCl2jFZfy9iRvU
 jiHNLJu3/cvQADm8uUAAAA=
X-Change-ID: 20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-331b26d4fbf6
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Michal Pecio <michal.pecio@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2777;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=eORHv6uMOxEZQvZKT0NGFZMJsp3s4BCbYLo0O/D16Zw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpwlgUNXlsxFgShF54TYDVG1RvCpnFEmpxXa5+pnAN
 EhfuNCOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCacJYFAAKCRB33NvayMhJ0ZAYEA
 CTtXaX+QkB8DgDMLvFTrRnE7nh8tqLti7a4LyO4nYHeud+aKpAFrzh09iL9TsRro7mPdHVa20bNJ9u
 3Sq+qZQd3ThEBEDzeO3oXDrTE0oTpH2HshAymgxaMQpG1MfnZdFHYFMpnU27xKmo/7OYVNf4DNoM1A
 zCoDM6YBHKNuxjO01QkwtivZgSaj8MGqxDAHF6juKnTscUri0qJpo8gESOppMHz+3CThUSeUphkY0K
 XiAEEe6tGlW5nqkQljBJyUQLvKpViMFEp+rcQPc/BCMYx7+rPE+XeNBqak7xO4G+dz1HlIQlaPp9Vz
 heEswCfTFi+shHXTfxwfXfge85LQwwS3G7fsJ0CCTeLjuJ1T73JH0422eshrdxwj3Qk7FTw7kr+xFR
 6OXhznoZxjDIvo9EwOPZKPJt7XWtdBvJeq/9YCWyg0DuR/9veDp1zBiw1AG9VsJfnZzvjD5rLu1vIH
 EV2o0UhJghb9n9EixQakI2MFilElfB6AAeNzRW6rJo354neqKYueFNtxNdbMkle/TTFze12RolMKJS
 nHRBaY8DsbBqbpa0JFEW+u+i0FP42fTqv6IfGyDWFZYIMr3kJCERDevPoX1Nxe+K/h31ykJnhuzaHC
 DylioeoldQHPsoyKVyXEoepO/MvydYe0eaxUkuFgEgmtV8UYiyV0+JB5QwBQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30146-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: D1C8B305AA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
which connects over PCIe and requires specific power supplies to
start up.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
- [1] https://lore.kernel.org/all/20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-1-1ad79caa1efa@linaro.org/
---
Changes in v2:
- Added the PCI ID for uPD720202, thanks to Michal Pecio
- Link to v1: https://patch.msgid.link/20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org
---
 .../bindings/usb/renesas,upd720201-pci.yaml        | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
new file mode 100644
index 000000000000..4e890d0d2070
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
+  The UPD720202 supports up to two downstream ports, while UPD720201
+  supports up to four downstream USB 3.0 rev1.0 ports.
+
+properties:
+  compatible:
+    enum:
+      - pci1912,0014 # UPD720201
+      - pci1912,0015 # UPD720202
+
+  reg:
+    maxItems: 1
+
+  avdd33-supply:
+    description: +3.3 V power supply for analog circuit
+
+  vdd10-supply:
+    description: +1.05 V power supply
+
+  vdd33-supply:
+    description: +3.3 V power supply
+
+required:
+  - compatible
+  - reg
+  - avdd33-supply
+  - vdd10-supply
+  - vdd33-supply
+
+allOf:
+  - $ref: usb-xhci.yaml
+
+additionalProperties: true
+
+examples:
+  - |
+    pcie@0 {
+        reg = <0x0 0x1000>;
+        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+
+        usb-controller@0 {
+            compatible = "pci1912,0014";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            avdd33-supply = <&avdd33_reg>;
+            vdd10-supply = <&vdd10_reg>;
+            vdd33-supply = <&vdd33_reg>;
+        };
+    };

---
base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
change-id: 20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-331b26d4fbf6

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


