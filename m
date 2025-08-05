Return-Path: <linux-renesas-soc+bounces-20000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6937B1B2C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 13:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D41DA181E30
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 11:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AAC2701A4;
	Tue,  5 Aug 2025 11:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVEtnCuS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA45526D4E5;
	Tue,  5 Aug 2025 11:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754394468; cv=none; b=MxLfNaxr1ID18f8Ire1PCD0WnqFYZThqDaQVRAKVZ3pQmZi84q7BSAFb33B0edGNyniv7jnZOj8vmJQvqYABb9GhLC8LDItcIpIdkRHF3nuhSIBvBxDXdH02g0JGGmktJWnj7jTMSm8IDAUiYEikkUXTKAuB/ERyaqsdwYtC/8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754394468; c=relaxed/simple;
	bh=ntfcKQw2vc1DObXPKTVB35Gr+e5wArKWY00G5odaHCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V7wtVIxqA2Lxsq/CNh8ywAhzDUy2wCKncUl7yvI69eHuK4LyCKi3tvNHBH2VtmRIKsZuqEClzH+hU9zYlhJGKWhP/fdUPhYf5eaNiY/QEmB1O8F/8arlCKjV3KIQ73O2MfrYXht4bpvozR/SMD/38QcR9JDsfc9lY9Nz18Pr41g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVEtnCuS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b786421e36so3102019f8f.3;
        Tue, 05 Aug 2025 04:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754394463; x=1754999263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sk5aePiDMVKtBZs/br62CkkbjkH2Vlvl++/1/Jqu+ho=;
        b=dVEtnCuSQCJ1RWiI1fvrgsut5m87+wmnkrCNNh1XWY40svtPbnWT/fGoYF7Czu8lwd
         U4vlbAKrQSXW9BACi2XWSGfwtDH+lI2RYGjNFczctuMt49eL6AvLgnlJEijOLqyRcq11
         dDb+ucx6826RXurXG4q8pwpBR7n85Lf68/g2yIUWH8AWEv6Z9cXvgF0dPC+vj7x+RHSW
         M8qoZwHnPShLHTKkK7F6SZ7E8tXE9ygc7qUFmE52oVYtikyxZIMwYpXHGPJDKPbL1bQb
         lVoQulkA0KDSsqLSua47Z0JT7Pe/yGPc3MlnvvrHitanNt914hZV+K2pXLG/sHh5hXSz
         QumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754394463; x=1754999263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sk5aePiDMVKtBZs/br62CkkbjkH2Vlvl++/1/Jqu+ho=;
        b=klyIDr1xg/bcSHE9MMJ1sWXH7n+AUCqHyAKVNF/ZGG0irJlSUqe0tVIIlQtKfTshVf
         kqJLtHnbKTH9gxsrReuKhcicg3f7YU6sElFy6pqPkLkbwv/J43HdSNmah8qp4IkZRbTS
         UeBKM+TxjL1JVrDAWZRqxoD2eXRrCCUr0fpJGsvy+b1x17N9/IBiU9eGCfmVhjtyfDfV
         6tKtqZwc4o1Y2jW3lvQfzBVweFT2h7hOETQO5zx3QxAuLRsa113CFaAek1E9he0Kt1Rq
         dC24mTeU8JFd7vtjWNu9ibZagFGMOF0K5l6S50uYLqIj6e94nf8/8WNHlGvwur7GR5h+
         zFiw==
X-Forwarded-Encrypted: i=1; AJvYcCUQvV1imrIRFq3+XaKZlhTwlC+6xpiqWrcleHMXWfkVOjubwd7XxRaVnBGIWXDJXWJoiRABALlapSCcM4kr@vger.kernel.org, AJvYcCVftF2yDzZnNgoUUBZzXLcl87UodzdFQ/1t9eechwg0itpU3LWYeQxhNY2ZKeNrzhpQt3QIguZlRy1A@vger.kernel.org, AJvYcCWAkhQ4ZlOWvHPYRNAxMmv9+2KNVQ6ErprS2rG/TIsqdy5DF/DPkOd9WEsjkgI/Otf9F5PZXNVDFYGKGtxE3ShaFqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSnjCKFxtDlWjsSO/gAN6tQiiqzj+Ft450oRDTFjUsFGwUEpyR
	Z8YacazW1N3bDoNgCILxD4orTLmC1ReuIXSy8sAxYdQ7DLZC9y/Hb2WU
X-Gm-Gg: ASbGncvIN0BISAxa43xEf5GMn0uuPX14u0lQuaYPZXilibX/KxCnk8MIZKSkFuLNJ2W
	bmK8Ld5pxqMpY+RlawU5dkV+x/fVL+LCgqMGDJVTrVjHaq7LoXttZ+BeHigqkOFGHLPeUx5dyG3
	zJS7WGlLqnqbASCeY4GwcBxbzmImDen3iUYywLXDvvIQIRW+wh+cWcIc4Unjm99n71dh2cwLYn+
	RoHEOkQFn6jNGYa6XEDmjfZDeYVl8hHRHtvio6mZ8AmUnOksuTSiU6e1Xtu4NVCRg2j1QDCjXy+
	fg5IUixOD62aaxcaLD5S1YTUxU0qB5lZOIIzoiMNDY0V4VhQ+U/wnOI0NtrvYMD+UVd6q2iukT0
	ZrXgAVWID5F1EbzRxbA2CrafH8ajDAI/SySKZJwNGJVvq1dVmjcToiyEX1u8fdt+wyPZWSilnwA
	==
X-Google-Smtp-Source: AGHT+IED93uqgQwKymZgLZVY4T8PzDxtgkaCyJJSg3D0APM7HdAC+Jamz2FXgVwWekuu8Ni/5qe4qw==
X-Received: by 2002:a5d:5d0b:0:b0:3b3:9c75:acc6 with SMTP id ffacd0b85a97d-3b8d94da16dmr9358397f8f.59.1754394462866;
        Tue, 05 Aug 2025 04:47:42 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4a2187sm19593597f8f.70.2025.08.05.04.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 04:47:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] usb: renesas_usbhs: Add support for RZ/T2H SoC
Date: Tue,  5 Aug 2025 12:47:30 +0100
Message-ID: <20250805114730.2491238-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805114730.2491238-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250805114730.2491238-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the Renesas RZ/T2H (r9a09g077) SoC by adding a compatible
string to the usbhs_of_match table. The USBHS controller on the RZ/T2H is
functionally similar to the one found on the RZ/G2L. While there are minor
differences in register fields (for example, the AWAIT[8:13] bits in
SYSCFG1 register), the current driver does not configure these, allowing
reuse of the existing usbhs_rzg2l_plat_info for the RZ/T2H.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 18a6ef4dce51..8f536f2c500f 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -579,6 +579,10 @@ static const struct of_device_id usbhs_of_match[] = {
 		.compatible = "renesas,usbhs-r9a07g054",
 		.data = &usbhs_rzg2l_plat_info,
 	},
+	{
+		.compatible = "renesas,usbhs-r9a09g077",
+		.data = &usbhs_rzg2l_plat_info,
+	},
 	{
 		.compatible = "renesas,rcar-gen2-usbhs",
 		.data = &usbhs_rcar_gen2_plat_info,
-- 
2.50.1


