Return-Path: <linux-renesas-soc+bounces-13371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE2DA3C4A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 17:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F1F63B26FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 16:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE1F1DC9A7;
	Wed, 19 Feb 2025 16:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="klMiooKr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85C01F9410
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981566; cv=none; b=LpRi4CBdNxobYN7Z2lkyCrzqkwicbKAmGehVYbKLXRfl0ZwuEtya+/owDfSKF+TQZijaAzZlMcszmTCn7PRKGM6/jgS8Wy9cCrlxG79yfFWkF99iRGtICYDywklSOntJHk93Jh2vo+eOLKn9dHqsHUXXrWg643Zhdn5ZuQBN8cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981566; c=relaxed/simple;
	bh=u9re8REjXvzfjxXgY3YZOGCROFhktmSNqqLvuZr/BdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LRCX6VGSpWADfWQAw+XaQsDVoV/Q4z+JJCrs9Yh45pWxweibRBGqBjfhKx++S5z6eJ1KNFcDHQBifuqKqZOrpwBJBGuk3ji2HrtcnxfP/6Zq7GF3lMV6XLffJDDqbUUc1R0+hNDKwgkpb9CG4SpVvj1Q58sHMXt1Ckjr3xoLZ28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=klMiooKr; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e04861e7a6so7146974a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 08:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739981563; x=1740586363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EjtQMF6TRiPlbfacQTAhkXNaJjpdhJbKUPVWmlaNaqw=;
        b=klMiooKrmcSRc7RSB90dBHDHBOzadk/MKMnP/lIa/O+w6CCa5GinDAoWpGwokHEVLi
         FAS32poSWqe1a9u/WJOgFwVGWiHlwiDecpIs0fHxRAExsYDNtSiWrs/Uoz7poWyMLAvs
         5ksvdGq0tybUbUVSAKKEYPDfA+8malYm4Tirn/DQfxp43u7PW0k7Ax1/AhOVzFnytohr
         0bcFoGjbb/iqCN12JZnLddfGAODfC6zTKUPhOsX+1Z/KFEryuMxq2N06W913kBjbXCr/
         Z0oeILIDDzBvEXpBJzD6gSU08dCVkC8OKSaH+z0kHMegiJiBjh4xw+CrpaEJIrIOZlHC
         42wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981563; x=1740586363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjtQMF6TRiPlbfacQTAhkXNaJjpdhJbKUPVWmlaNaqw=;
        b=snNK5duRuBQ6o+/BLKG9GDPw5ll4PXKhUyDEE1AkCq6GMqgPTc1V+FVg0tCzFopRS9
         lijcHMhBW/vzOKXVvo8LdOvstC7Bnq9Yr12Fe+SDnuCv+LonMpzb0jTfzkcW20nFdop3
         aRKJTHEhoXsrRl3aYHqaHVHkzN/H383GM9//AMPAbDmRUSOPlQocJmtuv7MO4JYZ31oH
         7ijNKHK4LHLXalyel4mSvfnEbHSqAXuQrH73W+4T6AvDRcBCLmBn4NA9iLhLYm8+WAf5
         LOfOb0FOV4btl8RDMM/xJh4vR4GSSYqXBc8YFW7itITlThFcWYGqpmBN2fcpgCMhwYaz
         E+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXr+ZPV1qyu/dh+/buCq5qpxpUYE0AdPaRsgXC2xlCvybD2fJZkae6kd+NOinmR0eZbFZ64fdoPcw1xf07NxQmTOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyctOkj8BtmMjkrZho+HMX+EHlEwi66f56PfvUEbJW6sRAGFxaj
	mlyA7i7AzmD7NdCLiKTbK+taG1v8FvKH4BfK1ppqRkD/ZWKb8htUS5eupo/50cw=
X-Gm-Gg: ASbGncuveVwKMr88IgRAw4flHmUpXzJMWwLiLVQh2XcuvdFAc6w9QQfNMVf7xbMibX6
	VHSbnc+6nbnW1TpEyC/4e9yWmwHj0oBCZPkD9HIzmYfMHNRjVN9R5nsaIgx/e4PdswvneKaJT5k
	b6exMMco5fynA8I3GwDhmOsm5zI0cMJMe+7X0bU2t9dpjDbscl9amsLd8Yiwc9D5CjhJXtRL6Gl
	aqN1/58ekMbTBH1Lul5RzyO2l0kHxn5AOdYWLCNMszhU119ykGHznT++xCz2ht5HhdYx4Fpw1ER
	fWuLSfPiRBu9TFY9wYk3oOPXWQdozYBkAeB8+YiNbQ5F
X-Google-Smtp-Source: AGHT+IFDZiBTqJrldYlbzqbLeUrNI2Old0Cil6RTu/LjqVXeUEAxzu3ZkZ9acNlt3bU6vH0XYRdRTQ==
X-Received: by 2002:a05:6402:1ece:b0:5de:aa54:dc30 with SMTP id 4fb4d7f45d1cf-5e0360441bbmr18248109a12.5.1739981563113;
        Wed, 19 Feb 2025 08:12:43 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e07f390626sm2548881a12.30.2025.02.19.08.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:12:42 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	biju.das.jz@bp.renesas.com,
	geert+renesas@glider.be,
	yoshihiro.shimoda.uh@renesas.com,
	laurent.pinchart@ideasonboard.com,
	phil.edworthy@renesas.com,
	balbi@ti.com,
	kuninori.morimoto.gx@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH RFT 0/3] usb: renesas_usbhs: Fixes for renesas_usbhs
Date: Wed, 19 Feb 2025 18:12:36 +0200
Message-ID: <20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series add fixes for the Renesas USBHS driver identified while
working on the Renesas USB PHY driver (series at [1]).

Series (with [1] on top) was tested on Renesas RZ/G3S with consecutive
unbind/bind and data transfer tests before/after the unbind/bind.

The unbind/bind was also tested on the devices with the following
device trees but w/o checking the data transfer (as I only had
remote access w/o USB devices connected):
- r8a7742-iwg21d-q7.dts
- r8a7743-iwg20d-q7.dts
- r8a7744-iwg20d-q7.dts
- r8a7745-iwg22d-sodimm.dts
- r8a77470-iwg23s-sbc.dts
- r8a774a1-hihope-rzg2m-ex.dts
- r8a774b1-hihope-rzg2n-ex.dts
- r8a774e1-hihope-rzg2h-ex.dts
- r9a07g043u11-smarc.dts
- r9a07g044c2-smarc.dts
- r9a07g044l2-smarc.dts
- r9a07g054l2-smarc.dts
- r9a07g043f01-smarc.dts

Please give it a try also on your devices with [1] on top as well.

Thank you,
Claudiu Beznea

Claudiu Beznea (3):
  usb: renesas_usbhs: Call clk_put()
  usb: renesas_usbhs: Use devm_usb_get_phy()
  usb: renesas_usbhs: Flush the notify_hotplug_work

 drivers/usb/renesas_usbhs/common.c     | 6 +++++-
 drivers/usb/renesas_usbhs/mod_gadget.c | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.43.0


