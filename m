Return-Path: <linux-renesas-soc+bounces-17190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F9ABBA83
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 12:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 332C1161CE4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 10:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FEA244690;
	Mon, 19 May 2025 10:01:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34502194098;
	Mon, 19 May 2025 10:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648875; cv=none; b=RUYtAuGqxsmz9abOEz2INx5dtMQcrwlpoUM32lyvvq/TtpYrEfb2ak+rYVmEnMbCtH2U88qdWymnckkKze0HUJBoU4jsQeMtOsEngW7/xjq1NH4AEqHQCaZ8+O0bnu496TIzEtQitTsfnOoAkrY88vIavCSGJxPLV5Gh88/Fe/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648875; c=relaxed/simple;
	bh=ZvfBxEgd6JZqk9Dm9LcPs6q4VTaVeWfGfXAWPSD54U8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJ/Xre/QnKq9OuTOP5HePnbZLx6SCNKqh8DRY5bcSJlMeJyuUsGfISJkRClH5C088/eAvDQKgqGIQbQ0ulcep7WCrfvgufO0aFD6/l3hhW1wdGk+fQa3uHGaFSJDx+Sbsgmkc0rw3iLpnMANfdiH8w5Gi0w1nbySlROAVKSGJCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47663aeff1bso40585801cf.0;
        Mon, 19 May 2025 03:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747648871; x=1748253671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6DUhvQdKhvWHJNQGOoDkdViWCqeLt50MGRDUCapEVw=;
        b=O6oxkro7iYH+AUeoZ2ZIPwAaNjmRptUNpWstdqQiMIIvOQoOFhR7opzV6RN5u6KugK
         ABqceorhp/W6YcSvxZmUf58TP7eqcOUyvd232jxV6oMqK//uXOnBexET8YHUOt7JP41+
         s+aggwppqamKi8tFMqnlk6yx5Z1LcedhBrrTuaEIV9iMFuaQg+q7sGVosVKFXofVjvgV
         nfg1Ho1xQ/yF6+TUKLFD39PPEEe4u1Sf1bAbJU5ix8pzFCjUoIsp4a5ZBL0TZREf+7lj
         5vIo1kpd3JXXUvKVkCib5VZDwnalFF9epcicvWVhfxew+ecDMvfmONlCZQCqUWweoENU
         xqzg==
X-Forwarded-Encrypted: i=1; AJvYcCVCy/zhyyrlD1elYgw0w+QW/DCKz2EknYPf7G3Y3Pss0YzWxrM6XSMFxTIjI60mBC2jaEcXaJwG5VvMJ1SqPTxteao=@vger.kernel.org, AJvYcCVVD8YXyGgpISmoy8FvYjYeCzJcdTBQG5Aimf3PIBzDaeGK1yl26qASB5DPq5kwlSFYMxvjv1rVFNii@vger.kernel.org
X-Gm-Message-State: AOJu0Yx237nPd+HCSguZiOy3qV4BHOUyZVD82SO/AAv/L/Qqp+8S202c
	VJ7GRluc939t6tfFFP5CYJec3si0qKkrL8850ER6I8ls1UiCS8JwNCOUeYAoqSUO
X-Gm-Gg: ASbGncsfMm7S1Z+p0XFJECRj09/Exe+gPw6g+IB7PlKNInt3scfI6TY7jL5wfTEwcjY
	dY9lgY/UqRcocxLo4raEi7O05z5SHbFSfkL/77TaG/ePzcf8xIL8oplA8pU8gb1u18hGmLlZ7DW
	HPJt80fugKoJ33zu7fLrgts2R35+WhmwR7QV76X86kXrtQijijCx0Aupyjw39bVU/UyDvERoDcU
	73dYZpL98XGdSXXjK7/gEO0DvVZ1oZcPvjrgkGq+11iGthCRIt9Tg6XxEAAMHCSnAvk17jb32mb
	ECMrImy/6GUFZzAnPIqKsx0cgk66ffdv6/Fpkq93hBkY0ue9NOpi+NUlws6glBZeyFqdtBj9DFs
	RXXvHxVuSyvndHu/pcA==
X-Google-Smtp-Source: AGHT+IGcul2/dqZKQ6VNAuuT1N7fMJrHUFiO3+AZEeYrmBi+w0noECaikynlXBorkeyKPckKcl0nxA==
X-Received: by 2002:a05:622a:1f9b:b0:48e:1f6c:227b with SMTP id d75a77b69052e-494ae3885d5mr238950861cf.26.1747648871361;
        Mon, 19 May 2025 03:01:11 -0700 (PDT)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae427fe5sm54864421cf.44.2025.05.19.03.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:01:11 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c55500d08cso467614985a.0;
        Mon, 19 May 2025 03:01:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuLs2I7GDePfhRoE8uch5zi6kgJYNAKNKirAJabc4WOwzGRPbXgCOiF5H+K5SIheyYiisZ8I57HnpTGe0CaZpgPW0=@vger.kernel.org, AJvYcCX1MD+5YtDs4YGaNUrTCpVuTo8KKwZlhVOwn4KJjwOST2K6UegaOrwnMypcXY110YGhe8tQlOroyIU4@vger.kernel.org
X-Received: by 2002:a05:6102:1622:b0:4c5:8b12:cd74 with SMTP id
 ada2fe7eead31-4dfa6ac490emr12320687137.2.1747648860811; Mon, 19 May 2025
 03:01:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYCPR01MB8740608B675365215ADB0374B49CA@TYCPR01MB8740.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB8740608B675365215ADB0374B49CA@TYCPR01MB8740.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 May 2025 12:00:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnPG9QcLu1ZVB3Jx9bhe3+EVKrOaAeSXdnsvHV5tZJ1w@mail.gmail.com>
X-Gm-Features: AX0GCFvI5MioUTEbSahP9Ed_bBYMRlc6haHPTmt-skbAOlK1N7FTE7MyHJLyukU
Message-ID: <CAMuHMdXnPG9QcLu1ZVB3Jx9bhe3+EVKrOaAeSXdnsvHV5tZJ1w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-ard-audio: Fix TPU0 groups
To: Duy Nguyen <duy.nguyen.rh@renesas.com>
Cc: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Nguyen Hong Thuan <thuan.nguyen-hong@banvien.com.vn>
Content-Type: text/plain; charset="UTF-8"

Hi Duy-san,

On Mon, 19 May 2025 at 08:43, Duy Nguyen <duy.nguyen.rh@renesas.com> wrote:
> From: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
>
> The White Hawk's sound uses a clock from the TPU, but
> commit 3d144ef10a44 ("pinctrl: renesas: r8a779g0: Fix TPU suffixes")
> has renamed tpu_to0_a to tpu_to0_b. We must change accordingly
> otherwise the sound driver will not receive a clock signal.
>
> Signed-off-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
> Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>

Thanks for your patch!

Fixes: 3d144ef10a448f89 ("pinctrl: renesas: r8a779g0: Fix TPU suffixes")

My apologies for missing there was actually one upstream user.
I have double-checked, and didn't find any other old users of pin
groups in that series.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue as a fix in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

