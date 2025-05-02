Return-Path: <linux-renesas-soc+bounces-16601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEF8AA6EE6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 12:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C5A74C2757
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 10:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9661E235044;
	Fri,  2 May 2025 10:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W4ACSy1f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF2C22D7B3
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 May 2025 10:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180646; cv=none; b=mJ3oDJUc19WpAKd708KcpHoUryotGb4wSOzkCgb0agQ/8X4oS9olXxXs4W9/YX02SlC84a5lOf0Wjpz8psg00EhpmigMPU7YMlE6I1Y8tZxjF6whtrXge0V+XTcSQJh2TY9QCd+21Opq4iwppfWfEmxnFg7jyUan1f9un/k6RVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180646; c=relaxed/simple;
	bh=NRaNRwgJw2ySpm1uszh7ucF+STEh9ICx8w3ZI3FGup0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q/JihlWabj+bDuOAsrbo8RDl2dHksNhnu53/DD6gpjswKyXwFVeXzXvoNgs4kkmRkqOvHcVAI2PJk2Zo4bzPUAO1DBUbaT8Rryq6ynDHut837/+d9aJfaot5j/Z8YsdtDNRcnJwxdgH+Z0zaSYyPvwD+9tbqIcs51LEzhUAhxqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W4ACSy1f; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e63a159525bso1468583276.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 May 2025 03:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180644; x=1746785444; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oq9tm7apv8HfpkSWn4ynXIbLe4Sy1cFrzADlYd9EguY=;
        b=W4ACSy1fnSwPcGXK2dEV4d+lOUGVD+OC0IhbxX6SqPz4X13uYAGd/4LWmBX24pMT0b
         HVh51EX/xM/9ZentZaFI6MnmlIT7/MXBp9d1BO5enfudOHDMg4Ti80/OYgkj2bEakG7R
         4MEQrDQ7R/h9i/8y5QtCI6ER892X+/szzAEiN8x5rNRUmGjs1ktFmrPbaOfXCD7Ro741
         IZt6l3wZ7ROlSwbAzyLgWElhmVqFUW+EfuxWNY4945p+dcPyIw8okF7/zfNKiuJGFoZJ
         +nQa2PP0Ere4C01gvlEqfyGMFThy1VLGEJpnM/Yf87BmgRpby7Js159Y8kueRKXsWHjc
         09dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180644; x=1746785444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oq9tm7apv8HfpkSWn4ynXIbLe4Sy1cFrzADlYd9EguY=;
        b=C2DDaF0IPFTnivpqGBFr30nNuBU4a9y/ZNYQ+Kv7+Ui/81te2IBIXyYEHSn0F/K84T
         QzIKvl2UhGziRpkneMa776g1VQI4bP9PI81B1p2A/QlJ2RkaRtwP0l/Cn7gdAO4VuE+M
         mZ7i2C3gyzCB+J2zfVjEK6s/hRf1WdPMWr0H3GoCP4HSWm8x4jr2dbmpATXp/ds0v8dr
         3ixFOA2uO0lunKp9V2cOKZ6a/BIq5MQ4ji/hScKdtmQeKiIOvgr1MpHpxBLEN7saZmRP
         6lqGY7Az7yh5iqmzA06A/XZeZyztIQMw40hG4UtKbzAfe3XPD/RJ6PybMZ2oqoGzOAut
         JfZw==
X-Gm-Message-State: AOJu0YwaF0lh3vHvWkjAfQzixolW4giPBHh2HPyU6fBStfuTth+Pn/uN
	GI+9mmuINRyPaz+oW3fZGPZ5EcpF8UyRmQPJzWbgX7kLUD1s19h6pSwAGwRt0AXlFw4w9TaoIMT
	kUZgE/v2H/3kcDg0mNnlDPXgAC8+jYIM2myXqKg==
X-Gm-Gg: ASbGnct7yusKX9zuV+lTJbGIIwUNXaZrAdfuOOKd05CEXQ4eHqxG02ITL2lZHuOsGk4
	QB01dbH6MS5NfK8q7kK6ODMXi9sIHSJTKwVOFeLCaNDjKSp4mk//+d6IOked3hqzxraOCsYb3nr
	SZDuTBeGOcvpj/7rRjgVKK0OQRoNCvc71T8A==
X-Google-Smtp-Source: AGHT+IF1X45kAsLeG6PaSemMtmpyHeuaIweQnw6Td3Ou//02ohdpFslomOMivlLZaBIyV1eeN+aMHMOr/NSsHT1rGmk=
X-Received: by 2002:a05:690c:6185:b0:703:c6fa:2c30 with SMTP id
 00721157ae682-708ced559f0mr38287527b3.15.1746180643593; Fri, 02 May 2025
 03:10:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501063325.7262-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250501063325.7262-6-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 2 May 2025 12:10:07 +0200
X-Gm-Features: ATxdqUHCpPYIkQisGH6-bEULr0pkesX_Fpa5p5kRjxJ8r-5G_t271XrpJ-c-dHY
Message-ID: <CAPDyKFq3AaeWOMiCAvHgxGzhfzume3VeJFFnt-f37h6g1mUo8Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] mmc: add '_can' to capability helpers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 08:33, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> As discussed previously [1], some functions also should have '_can'
> included. This series adds that. It was build-tested locally, still
> waiting for buildbot results. Based on mmc/next as of today.
>
> Unlike [1], I changed 'mmc_boot_partition_access' to
> 'mmc_host_can_access_boot' because I find it a lot more descriptive.
> Given that new name, I also did not see a need to rename the capability
> itself.
>
> Looking forward to comments!
>
> [1] https://lore.kernel.org/r/CAPDyKFqxHd85DsUH6eZVyoocTDrvwNu+wTLRBq-jUwDY+2iFTg@mail.gmail.com
>
> Wolfram Sang (4):
>   mmc: rename mmc_host_cmd23() to mmc_host_can_cmd23()
>   mmc: rename mmc_host_done_complete() to mmc_host_can_done_complete()
>   mmc: rename mmc_host_uhs() to mmc_host_can_uhs()
>   mmc: rename mmc_boot_partition_access() to mmc_host_can_access_boot()
>
>  drivers/mmc/core/block.c    | 8 ++++----
>  drivers/mmc/core/host.h     | 8 ++++----
>  drivers/mmc/core/mmc.c      | 4 ++--
>  drivers/mmc/core/mmc_test.c | 4 ++--
>  drivers/mmc/core/sd.c       | 8 ++++----
>  drivers/mmc/core/sdio.c     | 6 +++---
>  6 files changed, 19 insertions(+), 19 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe

