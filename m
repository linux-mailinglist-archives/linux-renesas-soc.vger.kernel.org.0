Return-Path: <linux-renesas-soc+bounces-28252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK00CKIok2kI2AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 15:24:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A704A144960
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 15:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8FFC3058BBA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 14:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B173131196F;
	Mon, 16 Feb 2026 14:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z3qIIcWz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC9031196A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251721; cv=none; b=bpNcoQIQR0EvACgpMq19Qa27buGv45Z4t2YEqq8odk69eGtMSL7N+z0kNHdoHf8iY5DG15i7zY9vPTI7HBFYQ7HvY01R7jny+EFfyX4xcCYgpyRZS8pMwUBQtwXmmyzhigUYjikCy4Kmaows7uejUx7NUUe1nKv4BRjs2ysaCm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251721; c=relaxed/simple;
	bh=swRvlvPe5R/LjcGwpOyqg3vGK98nZUkf0KBb5iWx1pI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J046JHe9QNnsBBx81ZldWHkZgHuivtoo0yElmLch5mWSh7UIEak46lRSGP50YinYPRQWsuWjMpEK/3wf3zc/a4m8+EqM652G0ctw8E+K8Abn5feDC3++mGCeY3neRGAm9kLemQnOjL1/KGE7/PjuEs4nXfV0+Gancr6N1CQpSbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z3qIIcWz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-436e8758b91so2650785f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 06:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771251716; x=1771856516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZG5d4AeEhK6Ekl6x66KHq/6RRjwI9BsPgGa3qMbbWPQ=;
        b=Z3qIIcWzxmE4w8S9n4xv/bxv9dSOYzAhNlqZ5kLfwVobaoTJT8itGtKk+Xaxu30iFH
         TL00mlV+/L98FK7k07YD0CyaLHSK61MH9MAbDa1oUvFaowkM2InC/VLYaCB/ElevvyMX
         Z8A+pjTKEi6AVYI8vSdqlpf24HubiH+nqBwvCXo/xiAkA10KPTpUDUMypUXItrnvt9Z1
         c6TW3kdlQLsk+cxfrqBttBWQCS/O+LY1W5mwC2+EcV/RQrErvH4osXBS9YOiIWN7PVEt
         KBhsB1QP+WevJpVhzj+ITKtDz9/2YIVIOY7VmEPPhf7xipWwmQhk76qibEUIIvj/LVD6
         rcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771251716; x=1771856516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZG5d4AeEhK6Ekl6x66KHq/6RRjwI9BsPgGa3qMbbWPQ=;
        b=GfY+hrsdAsW0fRu/ySP0wNYG4noqSnA7H5RJ+BuC999DunWdqJc2WQ5nQDxgRB0X3t
         iVHGagHYpQo/XJTHzcNsBzKfCP7j3c0eUa8kFD6D+rx3M25QV5coidkNtEYRNEMzZum2
         ASIi3YkIGTu7U6GQ2MuuoRcFig5qSpJEkel6P1LklojB0uVZYwIUIk+GO0jKPfiKx2d/
         1ZXZ6mMcK9mvTRssPBkAmIM75T07QcFQGhUS5autdqJYGq3y0ecw5roApdXXSM9pcPET
         wAVMYldhPDBAuXX3rm3qTu+mmKRwh+0ngVO5gaW4WHgcVS9U59RtLJ2wkc1kRNI4twCE
         Mg5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIiXIETMciCmlxmH9YpP2LTV4BFuGEHdXC0Xt7MjUJ0kc70g2ApumPDCvfnpmMyf3uWb86fmtJ+TQjXG/OouMWYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBC7nnMet0QhehxpIgHMqQcdvYHVoUEmQ59u7rvwqsAK0gKQ6B
	IhOAGfvDnY64NgRv+hrw35GE+u8LVwE4omiWBg685tDaqJLqe40F/3Nvp5drtr/q/ws=
X-Gm-Gg: AZuq6aL/5JTjyvtPEjw4d9ub85MzKilYT9hMJPiG2juNTP4yIjc+BgrQIc6JTKPnglh
	pzfFNcsGcZltNYCJHTXd8OcH5am5xWQGqkffGIBWpULFC1P+BorNypl9C53fT8uIO7mOg+x37+B
	C+GcT5zWz2ZL+IpkusWuQO4/M56GNyefvfePMuyO/NJhcLvL1cJd/hoRU1kfGYp+2XtPIVjezW9
	1SLtM6EzLrM4FHw/+DGcSXcCgRr+iWx6Sq3vBoHX2c7vi0Q6qRE4xse8zPQQxlUcBmYF/crNPi7
	yo4AmejEZQgXvp7L4fmPZt8SkcZAXUnYYOGuXxbidCxMHnSQSN+fIPo90RLK3tYfGS+EJ5pQNqd
	Zv3Q4KjTW+NfqQ0pKnuOjlWRB3b2QrSWMgz0oy+28tsRtdEnOTDiVVTLVBrCwv+8YlICC6WKxhL
	fZ8gDutrC8NmcvsWRApnWS4uv3OnvwKcnA7TpDDrey/rhi
X-Received: by 2002:a05:600c:a08e:b0:483:129e:b573 with SMTP id 5b1f17b1804b1-4838dbb7237mr17621375e9.18.1771251716237;
        Mon, 16 Feb 2026 06:21:56 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a63afesm86717475e9.9.2026.02.16.06.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:21:55 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Feb 2026 15:21:48 +0100
Subject: [PATCH v4 4/9] pci: pwrctrl: generic: support for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-4-802c82795431@linaro.org>
References: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
In-Reply-To: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=782;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=swRvlvPe5R/LjcGwpOyqg3vGK98nZUkf0KBb5iWx1pI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpkyf86/3oKmTNhtXBfUIVltuEb7HAf6vq+eH2WHPn
 MaSqsSmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZMn/AAKCRB33NvayMhJ0aIuEA
 CHBlURac/cOv5Cakz3+K/ib4WO7qrQxbVbVopkK5TDOIA1TWK3JF8aWU88IDXBRdqP0xJH65xItdCC
 mefkwdSlYiT1pcSLIJPnyPqyknEPwUzscGv2LOLIa+StI+Etp15Z5L4+AtDDzRf11oTbR+YwyPIuZi
 Y3IW8KcdrgnzyPe3s/kyF1dkBoAxT6kDKNddnQ1Iebs7zHuAe8xjPNkznhFPu3arsUHRDtUSCuyDd1
 Cl8FGHTGU1/EfG0v8vpf0m60EPMQN2MBnogK1wiaoCG+7JHC3ZB//B1lxVBorXKhpa7DnPNf87C3YX
 YnH6si64RgSlVrk2jOCbx3w2QbbWP7CJyXFrSsS8ORqz0i60OfG/ZuMSQOsbYQGUeWRexLuLrSBaEh
 Jy3YjKxFuHRW/TUfXtX0xEMmOlc+js2eX/wzpbM4eRQtAIm6wzgMak59hLll6Tjd8aPtDFn/o/DqIN
 +XNdxx4gAlFv5hzo7F2nGv0xr/M33gzSPS0w8yNV9kyEo6vqNF8rKEPUZT2sltxsFXyCq3wXqyJ0j0
 bia2Aktfwjzc5YWJum/tiufCob9VS3NlHePyY+CPweLIk07GNtF/JoKm+vQHR7tiog3IFAWiUX5dLx
 pmTjNP28AgLTCQ8OyH8g8dtkvHSQ/QQleeYEsYonvUP1Qzhf8y3lIcT80E4g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28252-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A704A144960
X-Rspamd-Action: no action

Enable the generic pwrctrl driver to control the power of the
PCIe UPD720201/UPD720202 USB 3.0 xHCI Host Controller.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pci/pwrctrl/generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
index a5b7b7965f46..1afda639f0c4 100644
--- a/drivers/pci/pwrctrl/generic.c
+++ b/drivers/pci/pwrctrl/generic.c
@@ -73,6 +73,10 @@ static const struct of_device_id pci_pwrctrl_generic_of_match[] = {
 	{
 		.compatible = "pciclass,0604",
 	},
+	/* Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller */
+	{
+		.compatible = "pci1912,0014",
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pci_pwrctrl_generic_of_match);

-- 
2.34.1


