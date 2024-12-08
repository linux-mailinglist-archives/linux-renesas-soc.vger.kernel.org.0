Return-Path: <linux-renesas-soc+bounces-11059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E5A9E8608
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Dec 2024 16:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADBD01882129
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Dec 2024 15:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A708F158A1F;
	Sun,  8 Dec 2024 15:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="uPlzO+lH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A764113B2BB
	for <linux-renesas-soc@vger.kernel.org>; Sun,  8 Dec 2024 15:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733673165; cv=none; b=ttkn5ls6N8pVTWlg141UnufCXTIfoKTnB2bpqEEgug4hHKa28GSoKWyukU30GAFwn3g9MVri7JIbc8ru6EWQWFEAKq8uMsTdg7+f/slcmQMPimesqsUnyXviPJQ3R1GQg3Y0zXFaNhgXfu6X10eIJfcaxqjiEDb3Du8EayF0Oe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733673165; c=relaxed/simple;
	bh=VD4Qw9f43PomdEuM/V+nuiBCc7OvB7jTuKobj+KPUAU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K9K70JLy0Y/58ZRTYspgujr0CzjWkbnVqNELjZyiQ25ebQ57lfVudaA9hrilMN6EIUlA+nelSRx3MPn4SzmajOMqLDyYWE25REwhqBpY48X2qJT3fGRiX+KzC8BV4+ERp1Xzp2rZ26KgjZkyb4vdo1x+GGKVwau+Tc+vJk1N0NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=uPlzO+lH; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so793473e87.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 08 Dec 2024 07:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733673162; x=1734277962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KUDshE47cNUIOHz1m9AcokVYqibtX3WeQ/bCIvMGGYE=;
        b=uPlzO+lHyH4SvDo+Xfmhyo/JWYmQkkRgCAcYbtTtHhzpsPcz5qabTBIFJvF8Z7TeEA
         P0jAn4kUrTC/HVYC5mwRJSeeBTSkT4MIBlT3KykkuOfpE4/JMIF8PP+Coxxloba6BqGD
         8AKpVtcF7wKgOOjQL5QjwGIYej6ox8Kba+5rmhuOoyNR0MqVWvi8p/UuBnq9q80OFrcY
         qahTDdNvQCjs2o+warcVYOE6uF/8GuPsRJDUo/92sKNySE6tU7z4LA9OyRFYdWysZEDI
         l3gbO5eFT8R7GSZ8gt3mgy9jhTGYONskVUcuqxJ81BrGZnjxPyKlzV8hQfEgY17zTebd
         opMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733673162; x=1734277962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUDshE47cNUIOHz1m9AcokVYqibtX3WeQ/bCIvMGGYE=;
        b=FTeuZO5T+ixZYvs9hkUyd5xWrPs1Ris4wh51D9Uytu6zcPTQq9UEYUJUxmqgXyw4yx
         px4g9tpwgU9ps/KA/B0YMftTJb80KhX4WenGmnPbCTEC7nVfvVR6Zsl878F1y0ms60O9
         Gxp56YW2mmJi2797sxcxxKKqUejt67bv6o9TM3sfvRZnK3ZhlnwwEkUmnn5B9xS6Qhmc
         sxIumNaEs3CswYs7lX9tGus/+nR4O5+PwUjKpPkyGqjzJ0vUfeyADfxWITuwgKZlYnZT
         8u2ooJml35XSNCbvaKbtxdklJazqFIj7HVfftlUjaMinmDrJEr4FhxoHvUolvnOg5hug
         PD9w==
X-Forwarded-Encrypted: i=1; AJvYcCW6CbV7giLXN4tsG5nxkuh1l93R2Oa+SLAx7LMiaPX5bAk/0KliNXC1kiA9CVatqyN2adri25Fq8Yr92HMB8gI6nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS8KYax09Ar76G/TlC83MTy8RY40CigErFJIF99tEZdlllwzKZ
	VdqHRqn6MtTYRNnciXTkLKowaZDmE+XE64xaDgQBfGe7apfpRZmvLI0XaRnTt98=
X-Gm-Gg: ASbGncvmgmqgt+9EJoQjcq1XTIvbxAtl+rB4gWJVqTVtQMXkkM5zDjW0bnKjPZeJI+t
	2LKoEQ/aryZI4nOh8ZbbJS71cxqLadlMUfkz+2jqpgRzMZ0FSBsAJYyijDgHs5X/ejgFPI60nuw
	alD+h5PYM+qTA0au1kD3cmuKRFjg/pzhqf9br4N+zxqtZOPD47VioiL0xWjuCjEidEQO6ST1z7G
	cKyYxlJI+v2kIJa9jjPPhk9wZycQX+etT4NVS0Xnh3Y8dC4v0BClWm9py3nZRYQ
X-Google-Smtp-Source: AGHT+IGHghPkOlkqc7UHPyf5HGz9Q3UJ0RZJYXinXIsqZJ5152lIi0r99E53/dB07JBNiLX9eei6Sg==
X-Received: by 2002:ac2:5b0c:0:b0:53e:350a:7290 with SMTP id 2adb3069b0e04-53e350a7447mr3078080e87.51.1733673161613;
        Sun, 08 Dec 2024 07:52:41 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e3a1ce70bsm580882e87.66.2024.12.08.07.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:52:41 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH net-next 0/4] mdio support updates
Date: Sun,  8 Dec 2024 20:52:32 +0500
Message-Id: <20241208155236.108582-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up rswitch mdio support, and adds C22 operations.

Nikita Yushchenko (4):
  net: renesas: rswitch: do not write to MPSM register at init time
  net: renesas: rswitch: align mdio C45 operations with datasheet
  net: renesas: rswitch: use generic MPSM operation for mdio C45
  net: renesas: rswitch: add mdio C22 support

 drivers/net/ethernet/renesas/rswitch.c | 79 ++++++++++++++++----------
 drivers/net/ethernet/renesas/rswitch.h | 17 ++++--
 2 files changed, 60 insertions(+), 36 deletions(-)

-- 
2.39.5


