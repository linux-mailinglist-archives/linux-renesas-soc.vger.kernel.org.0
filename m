Return-Path: <linux-renesas-soc+bounces-15486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4B7A7E4AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 17:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2913163B05
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 15:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072B21FFC62;
	Mon,  7 Apr 2025 15:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I6OlnTRM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145B91FA177
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039688; cv=none; b=FX6yEjwIU0UdrRUc6/dBDgXzv1HnZWW2LBAi1IEVgp/27OBsCeNFeJ7vFep14zUZM8u2bzG1MbZoNKHz2Tcps3a+P8UNr+cxjlOPZ1qBD4e1yKN6Mh8So91xFOZcSlA4W6W/63T6jH5Yqt8RAQCQSne5Ol8Hg25lATaiatYcH8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039688; c=relaxed/simple;
	bh=cLukb9C2aiYDFVtCN21ZKXnPdKtOqLTL6mgc0FrZp7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oiRtByB4D3L5LNX3mVGVeAZCD6TcHatJvsUURruVZQevWhG3+BmTMpfAcw+Ox0RB+yXlOcoKnXgHp/cqaEpwujJFj3INETiS98felUxX2qUfPusNDXiLcce8Udc3QtRaSWazAJJ5LcGbw7dGyonJcqRBHndn6h72C1CAC/gU7JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I6OlnTRM; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30613802a59so47792091fa.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Apr 2025 08:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039685; x=1744644485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq8efX9K/jKkGa5RDf6t3vrgLuokcYYa4oIPfqD6CjI=;
        b=I6OlnTRM201vUy+ZXODPHeJkUzVDlZQyuP2bUYZepXdkKsibZMnX6iWhE50C5OQxRS
         Ah+VBHZLo7oaOYAn7jzEUwyKVQtSfRIzMFZymjW1tFIeW+6obJJOALVJ0RQVjLMyyMDg
         Dr0xs75cX2gcVZaFm793jtelXkQZ+GT95XZMPezG7A361vKj+yBGYx55X1bMimRLEhTR
         9Ulcwqa0rYkPPDqL6P0MWRizljf0t6/iUJjvrtlGJFJ7VocjOfJOdRn22oFrEwrOh5UR
         V8Y22Oqxu5CookFLPzBh3KoPAfUuoQMb9FQpyTZsfoMbcxj3KrblT78EZXVw6gXt5iKh
         WbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039685; x=1744644485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kq8efX9K/jKkGa5RDf6t3vrgLuokcYYa4oIPfqD6CjI=;
        b=YD3qX/B2dUrBQJRdDBGpDe9Y99RCX1DmhfkgfMLH+6e5FCK4VIDZ/8ZYnT4KGU6Veo
         qSQ4RblFhGWIhkHSrlTSj9Qr2ZnxgPkeN1K4OcBIQm+1vtTwC7sPU7OYBUscqT6CWHii
         RzGVp7nBU3Ygbmpm6PP+hIMUorD96gTb3OrECMm1eoOKuf4n/wUJM2h9mzOkNtt3q5Xy
         Qftc8rf8lpOpmHMiUbmq7Cnty1Q91d51D6O9Yz9NmfqDREbcTZjDVk9KaFsr9CZHxjyH
         CpXIoCi9cUODAVMH7a+dezGFB3eYY5E+0QSQurlB29Xj8PdwLMpfqnt41Hwi9Lqs36Hz
         sofw==
X-Forwarded-Encrypted: i=1; AJvYcCVzIEzbDfkbbkaxnAUmksXOipVPB8K+QCVsqF9DC8NuJ6VwqfZb19k4qJTSiJbLl+MQDDmn+Arb4V956pOILu8T8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt7qbx+1NVsygsMRG6bv+4n1nVxS62hjmuoP6/lIx8K8b0jaGw
	a8+smAA9F01N9OOSHtNtumSAEMLEa8+Hcyf0v6es3XS2RV4x8SjsVEA+L0/ooXc=
X-Gm-Gg: ASbGnctU2fxktj3ZgVZtAq6MOgNqc+lPTRF2wOQVll94Wmp9MHSMlMoUr8Xa0eRjeUG
	i7OOglfrV85LeU+EQXJdgB05YwWMxNPQoFfbzTFIOG71V2yAyDtDrQ1LjUgNM3SBFTpy4fMz/Zo
	05PZ18Lcnxnk5LOMdsnXdbFo/XO+BWQIO2Unx+jkSOV0mSfv001HPkWu+haN6FjeHUKcJ/B5I9/
	hBlubiphhnMshzGEZKylNm07elLdnj22dGLdDtilRAp9BND8BKSu+6xdRC9jM8SA0VAEWyF1mxD
	K4I1SocDfXTELPkY+mdP6dFa3d13cMFJo1vHcRvhAo8JbyIYx5wqm7M0JoktBij0EE1BpyBI2Og
	x763lGKRsSHKmUR9TLbY=
X-Google-Smtp-Source: AGHT+IFObqH9uOMbw/LDaPSoxjH4CdvHzcUd44Am3VfEgwwKnpzakyOKNpnsTiRoTRb5UeyoCfSx0w==
X-Received: by 2002:a05:651c:1142:b0:30b:971c:96e6 with SMTP id 38308e7fff4ca-30f0c02cda3mr37282471fa.26.1744039685191;
        Mon, 07 Apr 2025 08:28:05 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314c62bsm16158691fa.61.2025.04.07.08.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:28:04 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] mmc: core: Add support for graceful host removal for eMMC/SD
Date: Mon,  7 Apr 2025 17:27:50 +0200
Message-ID: <20250407152759.25160-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
	- Added reviewed/tested-by tags.
	- Updated patch 2.

As pointed out by Wolfram Sang and already discussed at LKML [1] - an mmc host
driver may allow to unbind from its corresponding host device. If there is and
eMMC/SD card attached to the host, the mmc core will just try to cut the power
for it, without trying to make a graceful power-off, thus potentially we could
damage the card.

This series intends to fix this problem for eMMC/SD cards.

Please help to test and review!

Kind regards
Ulf Hansson

[1]
https://lore.kernel.org/all/20241007093447.33084-2-wsa+renesas@sang-engineering.com/

Ulf Hansson (5):
  mmc: core: Convert mmc_can_poweroff_notify() into a bool
  mmc: core: Further avoid re-storing power to the eMMC before a
    shutdown
  mmc: core: Convert into an enum for the poweroff-type for eMMC
  mmc: core: Add support for graceful host removal for eMMC
  mmc: core: Add support for graceful host removal for SD

 drivers/mmc/core/mmc.c | 71 +++++++++++++++++++++++++++++-------------
 drivers/mmc/core/sd.c  | 25 +++++++++------
 2 files changed, 64 insertions(+), 32 deletions(-)

-- 
2.43.0


