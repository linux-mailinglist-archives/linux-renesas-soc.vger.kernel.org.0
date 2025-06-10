Return-Path: <linux-renesas-soc+bounces-18027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB74BAD3728
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 14:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA789189D6C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 12:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF3929A31E;
	Tue, 10 Jun 2025 12:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="npQKOjWj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB76B299AAF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jun 2025 12:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559135; cv=none; b=WIoLG2uh5DalI5Tcw4e13qnAJ/Up7RXEfwj2bW/IyuKarRWFsNtxNMB+Mxh7lj3LcrsIoDRI6o+IUKZ/uGwHZtfH+rQXKPDdpGL+N+mpc82d+Aeg5RZ0uLvNNnzfy+oPLBAovMdAeZTHy64oAy9YS7jFNcXeyhMIaK+O48lE1YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559135; c=relaxed/simple;
	bh=sGr/PNAndJxKtPVU5XNTYT21VZPL04qdLeA8uRGJeaE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LYeutlZ6TouGLWxZCKysd+u3aQ5OxNwdr/B7DokGo9b6zDbvG3bji+QVHW1CkxwUHkqjqkq+CogXHjOH+CLyQV4LXhS9UpGCF9LfZZXWyqGwwgzWnjPTvIr2ZY9hZ8Jh5o9n4+bqSSKB2pKXWuqatMD2nO8E0uur7J1enndY+8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=npQKOjWj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45305c280a3so9579655e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jun 2025 05:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559132; x=1750163932; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rU7/4my6HqhkT0+Lx2O0XgxysZx4KZxVdbslyauHUzc=;
        b=npQKOjWjLURUeTn6hFa1JzLNNFJE2Cs+FLWyFIfPvRtm/MVZH0LQQW8XJ61DI7Mhf5
         IwrOdPxZYw2RdxYVqPGVkGishj2Pf13Jcyiwx8Z169xWyNgMGa0EUHmnfP9kmRmtvhtr
         OAWZJywIdF0PGc9TdOj9LcaLEXtJCeCOnP/8LZ4b8+ByKf0GAXK41yoZWcV2gDPe0TcM
         IcDsqMMVnmcaiFzn78jT7R9saU/R+Qfg54UAPk8y/dTA4L/9DebR/iSVoIz92nYC5eiw
         RPkAnPTCAgyBPSaqH9v67XDr89Eq1wcyRZkxQkJSq6vgH4o/Tgq811Uq8S54CYZ8gLbB
         K+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559132; x=1750163932;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rU7/4my6HqhkT0+Lx2O0XgxysZx4KZxVdbslyauHUzc=;
        b=EvNFwQdyWdNFMa4zp/sFPVMH6udN9kceVShtSVqkHYCAV1tYgxQlqV0yYIjEJrjzO3
         mUHwIl07eFNf3Ixic7Djb2hzlojKqBTTxDsQRB/7g9uQybUBNtnZ6nlBS92Bm9+bDKUk
         aGRdHxIs5XOiAfkFvmJgNAuEpsaXxDiW4q2qqAqcqUbeeKFjYuuAbIHbQvHO0vN7hNK3
         9AtGM0JQBpB8kXS3EF8Eyq89s8nCS5HuU1P5OgEChBCk93afJSua2dGlt4clQ2dAApLy
         sMZ27Qz5sfF/e2Hb+CbI9hrJhX7cmlFcXFk0h4ZAaJ5KNKBFVOGoMypS7RzXBoCeQD4v
         bViA==
X-Forwarded-Encrypted: i=1; AJvYcCVfQVS+VWQB5U7eACDLXQrQqD+OXb9FU9/B76aQ0HK0CtsG28T2BDsETFpKrIynbLsWvr6hzt5SMX9OSZ0KjrWD+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh9sKF8V2SOarLZrW/E+kzLsI3lb09R94NjJF9u9f4LFAL/JW/
	W9m7qYxHY/9pIJKyzsPvVqg50s1UUQhpTy3gByjT9/PtireeqrjMrqfkUN1RgUbkYOg=
X-Gm-Gg: ASbGnctFK3e9Mimu+rBFzFT/uPD7dx7z+9snsHHhl4HdZhmG2GefNA3AcBv3OiKrbsF
	5IyV89igPN0vAEeHN6gSF14bZBrdkbm8xpuI6vNONAr2huVxTG7B3e2yc5BfB0nxYR3CfbygViX
	Oey0aXtAeEp/qSMmdSGDX71bK/o5zgsEY4aCmg65DlmLOihsETuZNowwGMFbVFXY+xZBwokz2N2
	Ajn4tOKUKuHYaWX/wQIMF/QgUJ7507FqFasIVInk7ZDrVa3dkyNq4bVX1eqlMdyNRFnV9wdmc2B
	ef9GLYEl8NZlJEeCwpGxBgYGDlPwjpngxjZgdDq0ZHeqw8V90zyb5gU58p9+QDI=
X-Google-Smtp-Source: AGHT+IFUBxicO7hQVJhltf8pKkjk8eVddbD5uhxdka17FsMWwGoc9zt6HgcPXCEgQzPEEyRBJN+3Qw==
X-Received: by 2002:a05:6000:24c7:b0:3a4:f71e:d2e with SMTP id ffacd0b85a97d-3a531ce8887mr13210295f8f.56.1749559132270;
        Tue, 10 Jun 2025 05:38:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de7csm12374676f8f.14.2025.06.10.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] soc: use new GPIO line value setter callbacks
Date: Tue, 10 Jun 2025 14:38:49 +0200
Message-Id: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFknSGgC/x3MQQqAIBBA0avErBtQM6KuEi3CppyNihMRiHdPW
 r7F/wWEMpPA0hXI9LBwDA2678D5PVyEfDSDUWZUoxnwShyd54RCN+YHJTrUlvQxW23PSUErU6a
 T3/+6brV+xtJg+mUAAAA=
X-Change-ID: 20250523-gpiochip-set-rv-soc-14e1d9414f70
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=923;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sGr/PNAndJxKtPVU5XNTYT21VZPL04qdLeA8uRGJeaE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCda3jdxUjB3y8y65I+EGMTPUKfUhIEDVrAHr
 JBuGF9gOJ2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnWgAKCRARpy6gFHHX
 cs12EACyEHdV65zoM07w3fER71x+bL/lzzv9ak6UL5WWCzMWUhqXM9fuKnO9LcmVm7mqDVNveiN
 AUdXK0/68zZkddeVHu3ENhI9tm92CrnaFx1V2dLwfSBZ7ASs5GEIXvbV3X8Dni3dGphkpvJ4Xny
 gacdtzbCW7nrjji3x1moDcgcET9rxgkmlmmzMcT8+avcRJ68DS3xkcr1GQKPM2RQ/PoKKiQa4Ci
 G2NQC5B3wBRVHkMAz04e7aGy1UOxNekQrxf+0QzO5zgfVb/oo/QF4wqd90GNJSlgjrDlIq5D9mU
 /nJn7XnqWUim/BFCyBola7xRLAr0tdrRKwdmrDdRVULix6Z0CXPXoUgNg9WH6ZSRAgFjSpQRCrB
 vnPqDPNpD/kpE3zZ3W419DvEvcfWKN77fmoIIlgEZt52ZAUV6qc0kOeNxbnEt5JZZSDfloLKTel
 yxBEzzydWWDhu6eCO9iZ+sqZA0266BG1djyrNkXJKzayOLu14ADuG2ul81SZ1DozyPTiO1PIXse
 Z5+pwSdNtIhCqSzmPK3Qod/pzzh/DrDzvMbfB5azT2yP8RymRe7ERcn8iVfr0LcAKOozsb6tx8l
 SxZwGqbUdg/HDLqLVXMx7GWD55Rc+O61o+zkaJxX2U2+7ElCLC6F7YHw6p/4rnKaU8Suw50DagU
 mF0i2p7lsP7AuBQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/soc/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      soc: fsl: qe: use new GPIO line value setter callbacks
      soc: renesas: pwc-rzv2m: use new GPIO line value setter callbacks

 drivers/soc/fsl/qe/gpio.c       | 6 ++++--
 drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
 2 files changed, 9 insertions(+), 5 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


