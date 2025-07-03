Return-Path: <linux-renesas-soc+bounces-19076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B57EEAF6F8C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 12:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F4CF3A7D81
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 10:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4B028FAA5;
	Thu,  3 Jul 2025 10:01:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4B523ABAA;
	Thu,  3 Jul 2025 10:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536897; cv=none; b=DXqfbJuZZ9mA1ADfSPZ/hNDZP857IXiipUuiQ5xnRoL0UVp3fq4VBku0J+YMaognqu0j8Z46FI1fOkVipgoUe2ABA/Kh+oYVw+CDnopz1zaqneQHg81PIEJfXnmDuyr8SwAeHNFwski1+Pf9Bsr6RwHgwzzMzfBMPqcNqJ9rKE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536897; c=relaxed/simple;
	bh=RkNPZD0gXbVv9QMnhyaYHoHf3RLE4sm+UPdb7vIE3GM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lsdSpImXSkypkirDxi7/3kCilm9guyzz1wcWSoYhPE6RofcpdOxap3H6YCppvOtr8RzJLn8aPCFnRM+GpJR8HZXkQgoiOxzD8iUYAOZ/hfdob0PmwtcNaOoLv0Xyywj5soCzsWBbSlEow/0PPk2F8y0m/2u6NfJfg1tj6Uje13M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3e05bb6efe0so9895705ab.3;
        Thu, 03 Jul 2025 03:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751536894; x=1752141694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vk6ZYpOZ+r73oR7qUxC8epbzhU6ue1sl2KbvmZi/cL0=;
        b=GC0NIYhFKej6qrxRbuItsw5Xrlxci54mcMpgOViV0S2nOdoT6UUr+lZ8q1ncD5ud84
         4rGwQHQU/jPxby/HRYR2wD6WUxb/PolK8iGkWgFwX6bw61Faj9IMigxZBP1c+0TK4o0u
         YU+g4hyGuuXWMqDlo7hk6qfpFNcHHMoi83MrvIMeAXVH94w39hv4+2PwmM59wQrZUwnF
         aEwJOYrnZlnj61sx7yCICXfRsqzy4X6QyeSnFWkkKmov8RUbj+TA2TOwuOB49KjnHr54
         NXUfrOo+402dsaNsIwTvyZH3qs/AtvgeOonTRsviAVFWL7cB/d+QXKg8udvaMUc016df
         88KA==
X-Forwarded-Encrypted: i=1; AJvYcCUV5Mo5dFail/UyeqrKSxJazgSHOUzxutgsBINfqlczVNOt03HhcfS2ywUqgbriz5HMyrzYnFgz7FE1@vger.kernel.org, AJvYcCVFACjHpizGuHCeaUiyUhzz0Kb1nzuDTRUwEoLbd7DXXROJ53XC7lvBciwH1/JEXAJK+HJS840uCoe6PZDzjJpUhfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI9/9EF0VQWSkxpsH4McvPoQNFCRJqPrBUWD/nGL+WHQ9M87Wl
	Npm2RmT98Zpj50u+iLHcCNSGvQyIAbzG6yqekP0GiKH18NktXmArklAlOi2mE1b+
X-Gm-Gg: ASbGncu3hdZ2taDUWScb8mhfNU/+nkqqUKNxqmGN6HJv9rQN8gXuXSq8OrSeHNeFQY0
	s0+nwO5Ou6KYtSDfwBQlwiowSXzGB/BWVK+zGRjYOkklaz1IAVTO+wWvfe6pVsuun3Ef7+mecYY
	ucsAb5+h8tqTofGX370gFFO/bcSigNZi7RUKFTBsc+/9lU1zGvCGtKZZnNfDH6jTsFx8oCdhF/C
	No5B9vFTrhDJSI72o8CA8xXs7tFZUQyjlTAg+OnE+T/4zT/coWb9lZVyeAo9OAyjwMQU9t+fpOp
	drfD3in8AI0Fp6EyPSgb+4W7g45kg91krQShKNbhoEjiZVQY8q0mKOMj/T70wLQtv5n+G815VsV
	ORVMDtvnJhzZrzZnM1Z8m8HGlskHN
X-Google-Smtp-Source: AGHT+IGUuxsdq4D+33wM78MhGzji7JM2Hstbeo8SLiYZArk7OIbMPVR7f2Wc18xBsBQ6NRE72BYWOQ==
X-Received: by 2002:a05:6e02:b24:b0:3dd:f743:d182 with SMTP id e9e14a558f8ab-3e05c930472mr26973885ab.5.1751536893914;
        Thu, 03 Jul 2025 03:01:33 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204ab05a8sm3387195173.120.2025.07.03.03.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 03:01:33 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3e058e82584so12187685ab.2;
        Thu, 03 Jul 2025 03:01:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgzcftcezD1bo6j8Iur5Qhprga1Gt3svFmRiiCU58NKmeMrALZZ1Vd/Upq6PHhFE/Ep9rQ/COLZfns@vger.kernel.org, AJvYcCVnnhOR2ol/dh8eSYBnosYahuGt4jfJBbtphHis+HCCVZihIV7JnadDduZIiwI41OJYa51BmQjjgD67YZW1uEWsScc=@vger.kernel.org
X-Received: by 2002:a05:6102:f11:b0:4eb:eedf:df65 with SMTP id
 ada2fe7eead31-4f1762801a1mr1715033137.11.1751536881731; Thu, 03 Jul 2025
 03:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701112612.3957799-1-niklas.soderlund+renesas@ragnatech.se> <20250701112612.3957799-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250701112612.3957799-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Jul 2025 12:01:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7du6-BNo_Nf+iRWc3OVTiA1GVAzku05fkibvz=O7VgA@mail.gmail.com>
X-Gm-Features: Ac12FXxdJw4l-iJqGZpsG2LNm2BkE2ShlbGH23VCJfTiv05ZqsDAcKNeOwiDEb0
Message-ID: <CAMuHMdU7du6-BNo_Nf+iRWc3OVTiA1GVAzku05fkibvz=O7VgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: renesas: r8a779g3-sparrow-hawk-fan-pwm:
 Add missing install target
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Jul 2025 at 13:26, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The target to consider the dtbo file for installation is missing, add
> it.
>
> Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V=
4H Sparrow Hawk board support")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

