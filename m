Return-Path: <linux-renesas-soc+bounces-14748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECD1A6D7FB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 11:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A2F23AE1C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 10:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AA619C542;
	Mon, 24 Mar 2025 10:03:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7143822339;
	Mon, 24 Mar 2025 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742810624; cv=none; b=qKsCFx8JlVbxHOeWZTqcaW9NFcOEHfabUZU3kJcvcfxzLa1ZW/jb3acbSqM95ZKFfoKWlcUU815tbE/39IGArFYQWV5uqVI9ogJK9S67/87ORo17MASJlW/kGDBMggE4cR2OAazT/AlCFj6muX5M7H9LlL+p90RQQreCkKv9L/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742810624; c=relaxed/simple;
	bh=UUsI0Yf3LSlqidv27UoT1xNgBH1xYokdKDjpI7A6dro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9sT9EjbjkiHa7hAPkE1ZO0rAWPglxOuThFN5gxrd9JEIzErdwMiXHUZOFRmz7wfHe90Gd9ONBUQoDOcwwVfbmMqxpDS6SUTH6sQ5RQ9o6W5jOo9ru48RJMGbMq+aDua1UguQ/6DD+MaE14cIpfE0cnszRb8hs3sXhdbgsm3i/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-523de538206so1710908e0c.2;
        Mon, 24 Mar 2025 03:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742810619; x=1743415419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4an5EZEc/O/4TMi7/ZRMH2yqkpPVn07S2JgMUsIis3Y=;
        b=n3JhTuT9x+Q7+6OYkO1f3yWIvoN9se5iSPPL6MGRXndXm5X1/yM4YKa7eR0EW8otP1
         dZrk+B45OR6FG/gJk4Vtdh8xHmvAAycwBGz25w//wxsSmwKY4ljZiH11ts16zVIofffu
         hIAm2Wypizr2bQGGZCXTKma/A/6DZi4nc5bGNIJRYskRUCXXLcE0TL54qHzSejKfN5pP
         MnInvdCpvav+gkziJWd0Fgx+h8JtYjLrtchiaDrQiYeAmcr+d2uf5lxb1k9mIKGcurYk
         f6mY6Vy8o5pjUn0pNUcflxMrD4hav1xGwCsrQU2bn+YDVI2jraalcF4jig37jRauQJTQ
         Tk2A==
X-Forwarded-Encrypted: i=1; AJvYcCUaI4K6YHgB7uu4sKCMZ1SMRA9IiKVrxhQEYthvt4duZdstTZotA4XhiNHyW2gJvjLRaAiahwts4R1i8cCS@vger.kernel.org, AJvYcCV3tuqIIWhoVWWUgf/oO1KEKP7o1U956vEYTlY68sP4gOVX3OSF+tEgQ4uKAC6u1f3eRmFoI1MDg7SXGKc8JWyrjZU=@vger.kernel.org, AJvYcCWswvPGyD5ZRAXtR2LdH84TXUybslCaMumlhQJCkCjr69JpLbzcaa95LOh3sS1Bn0hFr00rb9q5qVyfzB4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynx+kEert8mNFekKhoofRzbJLSH+zy3c/pW25RW4av55U8CiRx
	Qo0TLyMMwGLXcPaxN04umUacwPmTu0DTKc7gG0BsjE2zFwG89L7wXKsVZEza
X-Gm-Gg: ASbGncuhDpSh4XARrPyExFZ6cQc8+55HQYG+HAb2ysU4oxy0vjYBRQ3fNZUmw8nOtWY
	Y7HJTLaOzfl+ovFTloPnbZ+bqj7Ndl5g0GWIgW4cPG3MaVIsRGs55al8QjYQ3yxB0sRskFS2YtK
	T/I71Jkk26cYPUUuNX1Cd32/jxgeSpbO/0j/PVASHdEEQLgK/VrA0twEuyWSFfH5+aH5z2ls6bB
	XafZdkv3TPwZIWMht4mRuKgSYzZ5GDTjlxvE6cJdTNqqDx1IBSVLl3UAyyg2V+te2xeQLFOa8d4
	5Gq/egquZFqb5z0J5A2RT6aOFQA5Iv+T1s3otECieoQNmnMMypm9fIzB+M/4XPnFmDyRk/jn1Ob
	XUnSPpfcUvI+XE2vbhQ==
X-Google-Smtp-Source: AGHT+IGeI0ZGzwpvG0mH7TuE44LwPqG0ell1IJjJ5zCz2gT1JnG7ijA73/zEUoTpR5qQd2pP2FujYQ==
X-Received: by 2002:a05:6122:2398:b0:520:60c2:3fd with SMTP id 71dfb90a1353d-525a833acc5mr8117549e0c.3.1742810619256;
        Mon, 24 Mar 2025 03:03:39 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-525a7359ccdsm1327348e0c.4.2025.03.24.03.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 03:03:38 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86fbc8717fcso487072241.2;
        Mon, 24 Mar 2025 03:03:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4OsysQ9aXjizmIHvz8/0I0txxJCSC0olVI+ukrdGZ+ewAIqGgnK6KMF/bgUB9kQMg5U/OH0sqJYsFQxJ0@vger.kernel.org, AJvYcCWOjgpZyW9aORfSwgu1odA7WNZq/6cHF+65H5T3yjuuzdsLwktXK8MycQE06+wO3aDpSfS0u+rIhKkcw7g=@vger.kernel.org, AJvYcCXzq8oDDRspp8TEKpeDpcP06P+DOIBh8ISkOB3ucSB2eufUPuf70BsgHFqPJ5NqywSZCZb436L0ndS7AjtP7cVWy4g=@vger.kernel.org
X-Received: by 2002:a05:6102:1624:b0:4bb:e36f:6a25 with SMTP id
 ada2fe7eead31-4c50d50e074mr8130701137.13.1742810618396; Mon, 24 Mar 2025
 03:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com> <20250306152451.2356762-10-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250306152451.2356762-10-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Mar 2025 11:03:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXZqnmhVcuRmdyxtyVwnonj1aKNdf=smroPrrcGe9yaxg@mail.gmail.com>
X-Gm-Features: AQ5f1JqhpiWiWGXr9SpPiXsEU6lVLKlEGzKLi0nA39A7Ors4tZFbjTvGRx51fDI
Message-ID: <CAMuHMdXZqnmhVcuRmdyxtyVwnonj1aKNdf=smroPrrcGe9yaxg@mail.gmail.com>
Subject: Re: [PATCH v4 09/13] serial: sh-sci: Introduced sci_of_data
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Mar 2025 at 16:26, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> The aim here is to provide an easier support to more different SCI
> controllers, like the RZ/T2H one.
>
> The existing .data field of_sci_match is changed to a structure containing
> all what that can be statically initialized, and avoid a call to
> 'sci_probe_regmap', in both 'sci_init_single', and 'early_console_setup'.
>
> 'sci_probe_regmap' is now assumed to be called in the only case where the
> device description is from a board file instead of a dts.
>
> In this way, there is no need to patch 'sci_probe_regmap' for adding new
> SCI type, and also, the specific sci_port_params for a new SCI type can be
> provided by an external file.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v3->v4:
>    - Fix the bot compilation error on superh in sci_probe_earlyprink()

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

