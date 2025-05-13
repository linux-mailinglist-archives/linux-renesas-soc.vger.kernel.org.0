Return-Path: <linux-renesas-soc+bounces-17048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66364AB5628
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 15:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 509943B4700
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 13:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C62F28DB7B;
	Tue, 13 May 2025 13:35:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EA228ECE8;
	Tue, 13 May 2025 13:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143303; cv=none; b=HkcAwgqAxdgpl7ohWM+yp1+ltuNqVt6MrS5fmxX8AWElVO5Vak2BuImp4pL8tDs4ERyghYGsJIk/r2I0Rh50MhAyyhIhY/3hOOVjxdp6Mtrvsw6/1MJs0ucFk6f45LtQlh5LCeRmq9ffVLKx+2P7SWv7mpBdTGWjScNordVQdCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143303; c=relaxed/simple;
	bh=P9nYdxJ07dCIy7FODfo1LjoFbgIG6vlkstSo/eDqIQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HrXqaVpD8wNynQ9fbE2gm5BU0dS0SVJNxk7SOdecH91A0xY3cSwN5tkE+3ZeZ/q5lTqzwrnOSvhC+9UVjS/Jk+6KGaM3PdFfSTgo/ffXS99WxZ8fuBqJPstFGnDOk+jbCizXVr/xdaTZQoG2ogHm+Idj0PMnyhJZjdvt5WV2zsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7301c227512so4543038a34.2;
        Tue, 13 May 2025 06:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143300; x=1747748100;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jv6f8gJJ3Yc5GMRZNr5+hOES3UZ81AyIQwF4NsF0AJc=;
        b=hjC1xFpDhIvXvoQh8fMCr/XxpPStqGzzcZ3nILYlGzMutNxmSHRhMBUPt6P9i7di86
         +iVRxIYG39uzHRccfC784Y7Yz6EVH7bnCVKmwlAYEYEiK9UXSc3vx8JLjJ+vs9VQHT58
         8i/hTF4P/f8Kju/GLVFLIsY/iNHVNyzaEE9k8JARUjneThAq3UFwoLkNfyUS5Coo8RkC
         3EnCC/Fbk19nQGlTCyWn0vbH3dhdiokJcpTv/ujWxpzG22cyyEPGmlksKt8k+FSMEUHU
         mVXFXd+V+k6hKagJbsyAFHxLJ7coj7d6QVrnNZwibyOorNTwO4llsPqEyKUkPPqNCWPG
         N+9w==
X-Forwarded-Encrypted: i=1; AJvYcCUJVFmNJwgHPH8j+tNIEcKVKkBi7CXTYsgS8C1QnP4um91YkSbFZEjG4aSojREKzuSKhITTpTr3UbGR@vger.kernel.org, AJvYcCUgfST8DACGjdhWTXXjkMJfabuDKJnrV/lFznTar31g9nHk2p7E/KFMtg2yVH2eUvOphakX9BGY60nP44/c01LTqJg=@vger.kernel.org, AJvYcCWshNT9nkMOod5Tc8kBgiEFlnKthwHp8I/F0P3Un67HSW86WzivCrln3jJFPDNSQ38ZnQCx/+NDvdZSDas2@vger.kernel.org
X-Gm-Message-State: AOJu0YyntvZUtPoZfeHFHr9X9nHx5eTztJrAdvE36vL7m6lCXI174my+
	S7xInaI4bVik9jZtmRmOzO47xaTij8fKg34L3ZVgAlb+1g/fegXvxc+bh2AV
X-Gm-Gg: ASbGncuJ5hQqgrpKdcBQYiV3su09dHJVMKor6HO3a+S7spMg9Zp+IX7boJlcN5mYcG8
	6cWA52YyofDUhEYNgEzeNplc9g2l/fUuvUWqk7NM29r0VXLVysZSkZPxOuGB/dvnsx14Yk6MVTe
	yDvb7myDVm7b3xzANoHdtvxNI/GSdnPXfqwZFtG7IHiiwKUVmQnrSLkNzsTx0p1yTtisywTSjwr
	TXCPjsdHIaqwj+LhEyPLoeY77RZLcxVImnShCffNardOklKSb/FS37A1Y5qxEDGqNMbL66jNyYg
	A4OsKg2m7vZBFybs1aHzcEPK4FynQxHez7IrmjhBRyEDDiS5NkwKqMw+A6pMSC04sTjlHbqqmXi
	0aCOyaDVz1QtG/VEFOg==
X-Google-Smtp-Source: AGHT+IEXrKXVjdWSxQ2/PfQw7h1kJZEQwVhRVSvBKEwQFt46xteS0M5FTXzMxwcCEB4t83jO9FpIoA==
X-Received: by 2002:ad4:5aa5:0:b0:6f5:436:9e46 with SMTP id 6a1803df08f44-6f6e47c77eemr263562336d6.15.1747143288938;
        Tue, 13 May 2025 06:34:48 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39f47a0sm67725536d6.39.2025.05.13.06.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 06:34:48 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c56a3def84so597210285a.0;
        Tue, 13 May 2025 06:34:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4q0aYbg2RxhGjYAbdvS3RYBF+7eWyZDTh3wH6A1j85QaGG821mSj4ORZymEixiEgeWBZiRNNuTVDd@vger.kernel.org, AJvYcCUegcfY5pVekNxYSl94n2wZ5kqg6b/IoDoYA6f2q46STAthss2dMTi/eANRR5TL5U/iZDAj9jvhx4pZoMW5@vger.kernel.org, AJvYcCWzGcOmhuM6+zKvbBWxDht+AWCWZeLqyzcaH2Q1FgAvl0ryly6Rch1cT9kK+7OtWzm5ZFPdtqHeNGQZrHhKKcit/qI=@vger.kernel.org
X-Received: by 2002:a05:620a:d8b:b0:7cd:cd:44f9 with SMTP id
 af79cd13be357-7cd01150239mr2964417485a.36.1747143288365; Tue, 13 May 2025
 06:34:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com> <20250429081956.3804621-10-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250429081956.3804621-10-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 15:34:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUe8RNNWfNJzFcbA_3u8FF7HzBjs46i+D17HNWNevCXkg@mail.gmail.com>
X-Gm-Features: AX0GCFucQszMqvG72vWmxfOCBykVdyFfTWc_NisAFrCmnPaaKPxj_OlYSmxOhdE
Message-ID: <CAMuHMdUe8RNNWfNJzFcbA_3u8FF7HzBjs46i+D17HNWNevCXkg@mail.gmail.com>
Subject: Re: [PATCH v8 09/11] arm64: dts: renesas: Add initial support for
 renesas RZ/T2H SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Tue, 29 Apr 2025 at 10:20, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add the initial dtsi for the RZ/T2H Soc:
>
> - gic
> - armv8-timer
> - cpg clock
> - sci0 uart
>
> also add arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi, that keeps
> all 4 CPUs enabled, for consistency with later support of -m24
> and -m04 SoC revisions, that only have 2 and 1 Cortex-A55, respectively,
> and that will use /delete-node/ to disable the missing CPUs.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v7->v8:
>   - removed loco clock
>   - added sci0 secondary clock

Thanks for your patch!

LGTM (modulo the comments on the RSCI and CPG bindings), so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

