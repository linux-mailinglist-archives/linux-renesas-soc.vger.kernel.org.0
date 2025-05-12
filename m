Return-Path: <linux-renesas-soc+bounces-16977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E93AB398E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 15:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3367216882C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 13:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2519475;
	Mon, 12 May 2025 13:45:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982524A3C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 13:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057537; cv=none; b=mAJeXexf6UpcUCxMWPBiUczoxdbAJT431EHcenj/Lhx0Vd6fVrC4DmWeCgNqSgONYQEdu+xP99E5blPqPMu7zPeQh/M8y1a+VKtTuTv9yg3Uc3q8Hp4EQYlvp+6zGhnw6NFteBxwlwGFhywBmRKQoIyhGCl48AMctXoHhdWGWb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057537; c=relaxed/simple;
	bh=HivyUZbDOHNS2CPVvcPUbm5ooz1x6rB0XXTQ5f+82Do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L4LCeHqjwQUcYN644+y1fd+r03sJ9Pd9R/Z2gnypknjZxteW4rInu0KYkjAGAfBDdIs+0yaextq2TteuQZuoCoCmDhjh52AlL8Bwv4FmBVMv9FmppH2+MvxZLvApK5K8hfWgXYQpcdZ4aLU2JTEs1YbNQvkTzeMhzMC8jedKtmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so57432596d6.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 06:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747057533; x=1747662333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6NMu0vJRVOQU+EPa+rVQN/F7xgR8/eTo9w4HejIL5o=;
        b=C9A/JeW4KZbfiUC78JUGG2djJHqBXv3pRxs3EshHWpKddhl45MI/J8uSIUCn7Yzcko
         RqHSKItXzeKMUfnOdGeSQRedwb8LuWrmGqhnfbGcjpdeBAS3IqCIrERY6pqNFtHcEgws
         Ag7+xjtZSTxF6Q79E3zGBpumsBmW8d7e6tdNMmb28auGlejP3Pt+sXDgZ4IXDbRy5rtV
         cyagGcTbB3X7Xa8dNCW3m8tEmPsuQIFb3wqjCRgBBmWDqS+EO1Q6lL2U5AgRdZa4DLog
         EEiAH5FqM9Yj+43UP+PW4tpO8fP8phSOlLgQJhaExs3mPPCBBsEmsbKRhSgynHRa3P5y
         4gtA==
X-Forwarded-Encrypted: i=1; AJvYcCUBxDDNoIKSv1ARLghqWiP0S9ztvS2v+HzjAbBLKyArhfDVlnlzooiEalKYxhgcV8vnclnn3sx+hcraJL7g/hbMxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkk3KuKhblv4rmJOxXip47xonu6tzUvkY4yYY0GvJQ7wX6iA25
	r6Xsx1JwPJ3D4JYFTR2+GO0NTvvaCIgBcBhA39VQI0hueJnc7aU98gZmpd9r
X-Gm-Gg: ASbGncurZDeUKc7gdJmxlF9oQPbTClYM1h+fl/F0lhTQIcW1M8oYgNUS5v0pBfBuqBO
	J8mHyHAjhA26YefPnoB1JgVuD6S76LRJfwk6gi3fO9lDAnUPjN+08EiqV1CYUDCV50xBRQeWPot
	sSKzZCwtafoeHcAB1aOBe1HBBQ/5udhP60Q0qTC6RfmXeooznweJRw3c322AW7p9YLpB9jnwoKb
	C2rBES26NKJ47xZYISSJu/H3IccDtHuloXTdjXJZxmD4SNMuoygwKtQbHHpuDBsuIm9D1D+Pds0
	ONr9Yi9YB8zzgk1Xd+PFx6VI4Ou8IJYvL3vKNYiSgn8NLT6gH0dsRMc+S580zv19RJA9UQ0Gf4i
	sBPltIU0Cyp4zzw==
X-Google-Smtp-Source: AGHT+IEpKERYXjKmA65tAewIUku5/qRKiVwzcnx93UuFLVQssA0gMif8Xd38e88xL14RbGzONtxD0A==
X-Received: by 2002:a05:6122:6201:b0:523:6eef:af62 with SMTP id 71dfb90a1353d-52c44228282mr11700984e0c.4.1747057522751;
        Mon, 12 May 2025 06:45:22 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c565cc6d9sm5399177e0c.5.2025.05.12.06.45.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 06:45:22 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso4181123241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 06:45:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYrrDUFd7Xk9wmiIyXE7Jkd//Y+YPizY4vowKf6HGCO2sOXywkcPVLdVEmNA49h1LQ7HJDP8Ugur9E7vLWm8E8+Q==@vger.kernel.org
X-Received: by 2002:a05:6122:679c:b0:523:771e:8b81 with SMTP id
 71dfb90a1353d-52c44468548mr10665080e0c.7.1747057512285; Mon, 12 May 2025
 06:45:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYRPR01MB14284CC862CF0D42C380455A0828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB14284CC862CF0D42C380455A0828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 15:45:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXB2P-zqjW8jgLA1E08zs8wA51sQJnQ5jYcWobAtx1Lbg@mail.gmail.com>
X-Gm-Features: AX0GCFvriKekn01qx6HVinb9KuZC_KqXiLeFVQhE5JXom-v1DLig0YbJ4gOgVek
Message-ID: <CAMuHMdXB2P-zqjW8jgLA1E08zs8wA51sQJnQ5jYcWobAtx1Lbg@mail.gmail.com>
Subject: Re: [PATCH 6/9] phy: renesas: ethernet serdes: improve stability
 after reset
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On Fri, 9 May 2025 at 14:29, Michael Dege <michael.dege@renesas.com> wrote:
> There is a slight difference in SerDes hardware behavior between each
> version after resetting. This step is to ensure the stable condition of
> initialization, especially for R-Car S4 v1.1 .
>
> Signed-off-by: Michael Dege <michael.dege@renesas.com>

Thanks for your patch!

> --- a/drivers/phy/renesas/renesas-ether-serdes.c
> +++ b/drivers/phy/renesas/renesas-ether-serdes.c
> @@ -265,7 +265,12 @@ static int renesas_eth_serdes_hw_init(struct renesas_eth_serdes_channel *channel
>
>         reset_control_reset(dd->reset);
>
> -       usleep_range(1000, 2000);
> +       /* There is a slight difference in SerDes hardware behavior between
> +        * each version after resetting. This step is to ensure the stable
> +        * condition of initialization, especially for R-Car S4 v1.1.
> +        */
> +       mdelay(1);
> +       iowrite32(0, dd->addr + RENESAS_ETH_SERDES_LOCAL_OFFSET);

Which of these two changes fixes the issue?

I suspect/hope the usleep_range() can stay, as sleeping is preferred
over busy-waiting.

>
>         ret = renesas_eth_serdes_common_init_ram(dd);
>         if (ret)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

