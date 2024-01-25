Return-Path: <linux-renesas-soc+bounces-1809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F4C83C525
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 15:49:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DFC11C249BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 14:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8805DF32;
	Thu, 25 Jan 2024 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="N0E7HxN7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1976EB5B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706194127; cv=none; b=DZS1+n74ujcPk2ccpwo16cSlTgw4y5XVTdgvoWXM/sIPpLwhOXCNV4wCexLfTwp8R43E87P+zUT2zjg64obV9RzDIxM0VsRIif0OSNl7iP2ynOHamkgA2qiUD82OcL13i9vUfMbcx8RN4ETkH+KsD/fWwCCZ5QafW9S8zR73TCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706194127; c=relaxed/simple;
	bh=Lri9+r3U5+UXW0b6nYnAwhx2o25q+wQCEH/6xNOMjuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9Z0uYJ+vXUN6dbo/P96UkZBJalMLEgW08SJ5JiykPHXwzGgsQxqlZ88dYpadbNDqOfs+es/VBQw94jZI+pt/YC5Ln8TCypEnCAIMJL24HGx/HxiGl6sltCqsbjbd7zn+zyOR68Rcr25CPzgNAOBppZlAqrp8iOLSbvkdgOrfRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=N0E7HxN7; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so8256649a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 06:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706194123; x=1706798923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m/VxeZJGjBjcDQmtxAoZtXCX3PaowqHCK6uf1JI14tc=;
        b=N0E7HxN7yrSYJdbkL0RPXUWLKdPbyPzJm1w0fLFROhNFU9mD5tOnw/weZLaz+Wp1J2
         ahxtyF+M4KnBVzhXmEuaiN9F7FQvbS5BzLvi48erHyzTNemPtSNlnCT3CdXVPvh3ra5G
         98vsf+PrdiJl5rs1pZ0LffJ+fia3pUqVh72qmVpAvIBVenQmnzbipGB5ku2YJFtPmsOW
         iltFVj+iMi78FgzmsPhy0LTBne6gv1KaHCG7LgJyutECi/PVNCqhRoANqnAR/S54lVuz
         aXKqUCrKJxJNhsp/LMmQRXJRBJp3DdM0Q4f4PBsbuOHM0HWnDYugGmRYU1b401q8+ZSS
         q/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706194123; x=1706798923;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/VxeZJGjBjcDQmtxAoZtXCX3PaowqHCK6uf1JI14tc=;
        b=MJiRTJ23cVy+maPY5OYOFBxhXFIfLh2FcdOZHaAgBDjTxhZaTfdOzRgoXXOxWM4Tnm
         I4bDDSsJ3yLjps7Petxd/yYp9rrvZIsP93QWYbNJ7t5WN6hYNk3bSpAS+RSjbNS/ScOt
         ER4SqBXhY2uQOLwX9xmK0Qgqg229uesdy+gZ4l3H3ub4gHhF/OlPtZJTDzf07nqUyyRC
         ry5ZpRT/mO7UB2+4jsSVoDPMHYz5+9xez8I+DQfETlWLrtcua76XNC+gyd8d0V31fpet
         hZ9yKABjr07Gbh+16XYgqNuQ5YbDocI7qEP5/EeZKvI68hqyVIVE3mxpfnubCG2Vk04J
         V24w==
X-Gm-Message-State: AOJu0Yz5hZu141rw2lfP4Nl+D9wCdpFaA4UPkHdVUQxEX9J29Sf667OR
	3VspIj924r91SmBXp+dpDmaHz3H7pnmVKZtvvW6biPHEbAs31kvqh4+yK/WDJPO4+0vRIfoNwmV
	9Gh8=
X-Google-Smtp-Source: AGHT+IGhyJMrPQn0fqcKBTnmjxLFuu17Nr0I1Uk6sabd53h7Ly7EF0zOXZMmHZTv9b7Ulo//CtDxyA==
X-Received: by 2002:a05:600c:212:b0:40e:47fb:fcca with SMTP id 18-20020a05600c021200b0040e47fbfccamr487664wmi.147.1706193753803;
        Thu, 25 Jan 2024 06:42:33 -0800 (PST)
Received: from [192.168.0.22] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id o36-20020a05600c512400b0040e52cac976sm2845655wms.29.2024.01.25.06.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 06:42:33 -0800 (PST)
Message-ID: <928267c8-2c79-4f76-aa6e-26dc63c77e43@smile.fr>
Date: Thu, 25 Jan 2024 15:42:32 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] kconfig: remove unneeded symbol_empty variable
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vegard Nossum <vegard.nossum@oracle.com>
References: <20231125163559.824210-1-masahiroy@kernel.org>
 <CAMuHMdWm6u1wX7efZQf=2XUAHascps76YQac6rdnQGhc8nop_Q@mail.gmail.com>
 <d21298d9-fed6-4e08-9780-dbcb388b9ccc@smile.fr>
 <CAK7LNASaG4DpHTb3YHMd8d8DJ5H3z0aiUcSqX+=7CZb99kRU8A@mail.gmail.com>
 <b65a68eb-6b96-41ff-bbb9-38cb2dee940e@smile.fr>
 <CAK7LNARVbjVkP=v7uQDB=Z+Ntcy9MiFa6WowTX9mA47YjS3zTg@mail.gmail.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CAK7LNARVbjVkP=v7uQDB=Z+Ntcy9MiFa6WowTX9mA47YjS3zTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Le 24/01/2024 à 21:12, Masahiro Yamada a écrit :
> On Wed, Jan 24, 2024 at 5:56 PM Yoann Congal <yoann.congal@smile.fr> wrote:
>> Le 24/01/2024 à 09:09, Masahiro Yamada a écrit :
>>> On Wed, Jan 24, 2024 at 12:11 AM Yoann Congal <yoann.congal@smile.fr> wrote:
>>>> For what it is worth, CONFIG_BASE_SMALL is defined as an int but is only used as a bool :
>>>>    $ git grep BASE_SMALL
>>>>   arch/x86/include/asm/mpspec.h:#if CONFIG_BASE_SMALL == 0
>>>>   drivers/tty/vt/vc_screen.c:#define CON_BUF_SIZE (CONFIG_BASE_SMALL ? 256 : PAGE_SIZE)
>>>>   include/linux/threads.h:#define PID_MAX_DEFAULT (CONFIG_BASE_SMALL ? 0x1000 : 0x8000)
>>>>   include/linux/threads.h:#define PID_MAX_LIMIT (CONFIG_BASE_SMALL ? PAGE_SIZE * 8 : \
>>>>   include/linux/udp.h:#define UDP_HTABLE_SIZE_MIN         (CONFIG_BASE_SMALL ? 128 : 256)
>>>>   include/linux/xarray.h:#define XA_CHUNK_SHIFT           (CONFIG_BASE_SMALL ? 4 : 6)
>>>>   init/Kconfig:   default 12 if !BASE_SMALL
>>>>   init/Kconfig:   default 0 if BASE_SMALL
>>>>   init/Kconfig:config BASE_SMALL
>>>>   kernel/futex/core.c:#if CONFIG_BASE_SMALL
>>>>   kernel/user.c:#define UIDHASH_BITS      (CONFIG_BASE_SMALL ? 3 : 7)
>>>>
>>>> Maybe we should change CONFIG_BASE_SMALL to the bool type?
>>
>> My first test shows that switching CONFIG_BASE_SMALL to bool type does fix the LOG_CPU_MAX_BUF_SHIFT default value.
>>
>>>> I'll poke around to see if I can understand why a int="0" is true for kconfig.
>>
>> Here's what I understood:
>> To get the default value of LOG_CPU_MAX_BUF_SHIFT, kconfig calls sym_get_default_prop(LOG_CPU_MAX_BUF_SHIFT)
>> -> expr_calc_value("BASE_SMALL" as an expr)
>> -> sym_calc_value(BASE_SMALL as a symbol) and returns sym->curr.tri
>>
>> But, if I understood correctly, sym_calc_value() does not set sym->curr.tri in case of a int type config.
> 
> Right.

Thanks :)

> The following will restore the original behavior.
> 
> 
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -349,12 +349,15 @@ void sym_calc_value(struct symbol *sym)
>         switch (sym->type) {
>         case S_INT:
>                 newval.val = "0";
> +               newval.tri = no;
>                 break;
>         case S_HEX:
>                 newval.val = "0x0";
> +               newval.tri = no;
>                 break;
>         case S_STRING:
>                 newval.val = "";
> +               newval.tri = no;
>                 break;
>         case S_BOOLEAN:
>         case S_TRISTATE:
> > 
> But, I do not think that is the right thing to do.
> 
> Presumably, turning CONFIG_BASE_SMALL is correct.

I'm working on a patch to do that.

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

