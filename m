Return-Path: <linux-renesas-soc+bounces-4732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0038AAD1E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 12:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE6E6282B76
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 10:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548DA80027;
	Fri, 19 Apr 2024 10:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqca9ky9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51238199C2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Apr 2024 10:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713524130; cv=none; b=oB6Ws9iEPx3nMuvflFAHlXmg1qVrlgOLf5krPCaAZTWPbDeL+nRHzP1kNeiEYiZE26wejFX+D0FD6rLgQKqAhCL3YMcpAx3DTkNPDTIm++rlXjTLopKuKKJ/kaZotZBUwFwZ1CS9FdXrKhl/Gvmp0oYh1cn/ibLzNjjeKVG7n5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713524130; c=relaxed/simple;
	bh=AJpde1qn+qHPvxRbNDE2LDv5w/e404QDaCryGRnfFQQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NTggpNHL1W43foGtYjRBHPXTQinnd9qMpXjsTpwzzUa/2BnZqmJKdOu7JGxZLS04//FbbLXdwt4hKtaDOyFQg6bYfkcolC3QtIXlVijgO9xcgx22+UuPwaAgWxylcE6P8P2uQ5I83NBLvnkfDFSv2W9A9nYAHBRSMxHd7Ko3Dls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqca9ky9; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4dad4b35d08so1748213e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Apr 2024 03:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713524127; x=1714128927; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AJpde1qn+qHPvxRbNDE2LDv5w/e404QDaCryGRnfFQQ=;
        b=bqca9ky9dZn5zQXCi2tV/maVUgiZ2Ys65I3lkJFabnS9dcGvevflg7LxUQTBNMwvEq
         8z4CG0RqLKwwcqbqNJThEFPRoqEK212ZDUd/+I2MUPWc/SaSdWlYFBbY4wkFtoxaPUbj
         4t7qs/SKqR7+5TDrk1FzjL9vS4KErbAb2bfnrMeAoFrEYmcHT0PZGAO+0bbdaykXil6o
         Jx4Lr0tU/2ucQWyLG7AHbnnDxOJHe7pFsROJXJzSWvp52NVq3ICmxyznJ4bU1q77C1Xa
         9j+8ErS8eqX8WxRv7lNB5DY7Z5VQYfkoQKGow3xIc8S29LpU9rqavlQ46gRDGNkBT7z5
         GCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713524127; x=1714128927;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AJpde1qn+qHPvxRbNDE2LDv5w/e404QDaCryGRnfFQQ=;
        b=Rn4MD5vrB3ZBYfV4rc52gyn2+Y/g3PULdRtq0WRxvARbJL7hhsf2/wJNa2g77oFsO3
         wPYnh1+ROLMv/nLteRoNsXhzCCMBPGKl0AY45widjurraVwAUvQ1bkJ12LBxKpdheFJr
         pJewpxC+uR6YF6hk8KjwfOT50jTSIn6gjIClKGGKsRMxYvOPJ+qjAiunBc2XtqLmaqrJ
         SPdDVdIXIamBHacqlXUyEa7tAVijomujluiHIWXtl13FRdORe60DZWOOPqsfjf19OT5U
         Jz+zSMWTjOHDU+0mPJo9AdtJIzVpC8oIWBbSTwpUvYdTRq92k2nsdT5AFPJusLyM0OjK
         cBCw==
X-Forwarded-Encrypted: i=1; AJvYcCVw2x/C3Nn16O33B5vqhNuxVkNKx6gB9Y5mUPjkN7yR9vR/ud2iEuEAlyVB/OTWVB/QxCaOJdj1MCqBXpEeE/zbJZk02j2MxYPstJdxkrikEgs=
X-Gm-Message-State: AOJu0Ywd1ZlUvl5WXmKiUWi3QZnwslcYU1h75eTtDenYwej/6mM0UkLS
	af9B1Z+JtbvjO2CLDtGy9uSYhMZjyFJ0hUfF4oq2UHKC+RGaaNyUzLBdSNFma1mO81YHB5zWENs
	bq8iSE8WZKX1YGr7P08MFUiV1MzBvZDya5A4=
X-Google-Smtp-Source: AGHT+IExzG3viPMFPbaxoGLnZ8jIqp3FKu9PdrwgTMpCLvebWmJKSn47J8ILhbO/oF2OUfYDw0JVyApUNMD+xF5xetE=
X-Received: by 2002:a05:6122:a25:b0:4da:b132:6dc1 with SMTP id
 37-20020a0561220a2500b004dab1326dc1mr6876580vkn.1.1713524127115; Fri, 19 Apr
 2024 03:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 19 Apr 2024 11:55:00 +0100
Message-ID: <CA+V-a8tO_nks1gZ7xsQC3Dr+A6CA4qAbSpZDMHYUzK7j04cNyA@mail.gmail.com>
Subject: Modeling the register bit as a voltage regulator for SDHI/eMMC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram and Geert,

On the RZ/V2H SoC for the SDHI IP block we have SD_STATUS register
(page 1503 in [0]) which has a SD_IOVS bit that controls SDmIOVS pin.
SDmIOVS is a multiplexed pin when '0' is written to SD_IOVS bit the
pin state will be '0' and when '1' is written the pin state is '1'.
So instead of a GPIO pin acting as regulator this SDmIOVS can be used
to toggle 0/1 which will control the pmic to allow us for switching
between 1.8V and 3.3V.

There is a similar instance of regulator driver [1] which is
controlled via register bit write, but in our case the SD_STATUS
register is part of the SDHI IP block itself.

What approach would you suggest in this case?

[0] https://www.renesas.com/us/en/document/mah/rzv2h-group-users-manual-hardware?r=25471761
[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml

Cheers,
Prabhakar

