Return-Path: <linux-renesas-soc+bounces-18948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3595AEF31C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 11:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A6A7179B08
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 09:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079E126C3B6;
	Tue,  1 Jul 2025 09:22:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EB225CC4B;
	Tue,  1 Jul 2025 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361748; cv=none; b=escEW2hgtwtcHiuvMdss5U40a0oWJacCdoLzK+eGW5HGsw8oQvMAuXHaeqyytpcg8rfUXf9T2OCPLTdvzRVxmt3q6ORNh6lmFSjA7EgX3RbBbP/U65xhe/XzrPLqFo3fds2lcJuhXIY3NIJkHfntMdBgcbwH0+BVAkF2N70LoH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361748; c=relaxed/simple;
	bh=kNU0Qh0UWY6C9Ff0TdpqpObVRU1t6f9dtCnDFQq8W4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oOaA2CLUPeIMztoNoZ1hDmjpRqDkR4ihdcS/pSlVqLiCnpv1GpWapwBc+malGa3vSal725YyKy12tsKpdJQdEPxYelKJ1wP8ZF1/4ANFpSLM6vG5kNmCpWvQib9fKiJcuEjcWyXu6ZIM4Om7tqK2+sLdwWsDPEDRTV8Dvu8cLJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-87ecdf5f326so3474285241.1;
        Tue, 01 Jul 2025 02:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361745; x=1751966545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUm/+QERyPsocCD8Go+FS+WuySKzS5FIx0c+iuNFBk8=;
        b=grEboFJX+Uzgpogo4FXDYZnmnQM4/wwni6cyK2ultU1f9xgQlio1/GHbLKzu4zzcET
         OT1JLp0irzCTSYYAWTu4/vlWaiaSrDZGRMOF8fmGc3BJQYq/29YNUXX3tqrIoNx9U9Di
         AM2ur+fu55n0jqg39Yg6D3dZ6eeLxDKpxGcQgJVMizmbVfw483OeeFuPEu9E9c6Vg34K
         MXgI/CkAYLEvKFfVNm0EHG/qbaRtBYp52kRQ7lHGUdxySdUD2lVoCu2LYKozvH6wARvS
         6C4ktKV9lHY8k8phg98vGz28sycpz80H9MQN7cOjtui+tTMuxYKQMZTPnyCDjWmqFSlK
         HrKg==
X-Forwarded-Encrypted: i=1; AJvYcCUIo737b+0eqzCfirNI7DKYAC4Qdk/CphbKwl+Dg6k0paVSNxd0ltQ65vU/dU/3MhLod49myiXqjHRRoxls@vger.kernel.org, AJvYcCVYpWM3WTcpZtFqoWY/Nrnsm5CvpnvUI4tRlVpPLPynS4GppCPn/CI+lQA7vPPlbbwL3zN6MNBKzyakmjq/@vger.kernel.org, AJvYcCVl4BnWVQtDXx1Ur5mP1PBIZEBDclGjdTWccVGAEEFyPbs21vjfA1BcU+Qro3oSZqHPGxPsGzwwpKMW1TNY7KasAUw=@vger.kernel.org, AJvYcCXAzgC/y2XP8AdIBCGL6bp8H8sMXlwDvewGGGkqo8BEgGDKqToHjkZOjp0c3mHHaQeBhkKjE69V+9SW@vger.kernel.org
X-Gm-Message-State: AOJu0YwO1IA5y7dRHSPST7MZxp73e9XCrhv5UcD5FUHrcgd3L3HLWmo3
	N9E/D5ntZGZFTu7h/lOB0llgaqTvV9AUTpLBO2RpLA9BQVQ4fHQLj/QaXhn1jY26
X-Gm-Gg: ASbGncvvlnYIeep9NtAdPawFIBcNo0zgud8nmKWb24qM/2xZvAXkFWT/CLiq+I5wCiN
	UnqAMhhbZ5XepXwnC3urICQlxzmgSbEx0cgZR2/DHggRd5azRHFwnwSSs8TzQ1Xt808yapzBbqW
	GqzB8P6XCsuP0fz2J4QdvEBSbrl4+PPxG/r2DnA92FrtV0D9Ev7FNhNJBC63e83rws97mNDqzJt
	545F8fNqexAaf+CPQPmamKzR6tdGWlXGscaxwGA8pZpBwrUsgOpNIKYhSXww1fFd7MDjbTrzKTM
	jqbpdiGe6VHJiqC6kkmnkAbhKuAQMqYr1SRtvOMXuwo7d+B3Z0ZuCQqcr82oels0qHmjsOHeMTa
	ao38HJwaOk/uUOhrYNwn3nwUUcXEL
X-Google-Smtp-Source: AGHT+IGRSsYCs7VVC9AeL9uT+P5Wkryoxe5tKmaxs6LAMyzLQJU1lnEqSfIRfDpIIV5SIf7CWVuhjg==
X-Received: by 2002:a05:6122:311c:b0:52d:cc6f:81a2 with SMTP id 71dfb90a1353d-534256115admr1637632e0c.6.1751361744753;
        Tue, 01 Jul 2025 02:22:24 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-533091bea7esm1661363e0c.29.2025.07.01.02.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 02:22:24 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-53185535ed9so3925623e0c.0;
        Tue, 01 Jul 2025 02:22:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvAd3gdKYeDPvqPHltWz9iYlc+J3XF5w2nbjzaINRublfN0vn/rR8saNw84bpz6cCReBe2qOIhm37ZBzmg@vger.kernel.org, AJvYcCWEoF20M9UyOU8Gp0HFlqGGBkAbCewnSj1EHxhIfSdHHVe8M5e0NJDgg8b/ktY5tH99HR41c1ohwmiaUfly+xZVn8w=@vger.kernel.org, AJvYcCWlz9/KBwoQKv52cY6PW4D7EUJmHdp2BejWsP6l+H4bZ6QWFJ5uCnydUEMzMD8nZeQd2XmCEVaeiHULt/Lf@vger.kernel.org, AJvYcCX9a64roQFuTMvOhoT7lThJnbbawtYnMrgWK13hdp+Yj9i4PMu0cOpedxMA6/amL6j4AglcFgIbzggU@vger.kernel.org
X-Received: by 2002:a05:6122:3089:b0:531:3a03:1122 with SMTP id
 71dfb90a1353d-53417f7937bmr1670875e0c.2.1751361744302; Tue, 01 Jul 2025
 02:22:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630202323.279809-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250630202323.279809-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250630202323.279809-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 11:22:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDtvKjHRAyvCPpBAf8uuK1EL4p5yo0e3QHeVqn=pC3OQ@mail.gmail.com>
X-Gm-Features: Ac12FXxbh-YLa-x4qYu4MdRAklij9uSF8x54ewlANZ0ZK7sR0ovq73GRKlK5Jnc
Message-ID: <CAMuHMdUDtvKjHRAyvCPpBAf8uuK1EL4p5yo0e3QHeVqn=pC3OQ@mail.gmail.com>
Subject: Re: [PATCH v14 5/5] serial: sh-sci: Add support for RZ/T2H SCI
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 22:23, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>
> Define a new RSCI port type, and the RSCI 32 bits registers set.
> The RZ/T2H SCI has a a fifo, and a quite different set of registers
> from the original SH SCI ones.
> DMA is not supported yet.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v13->v14:
> - Switched to using `EXPORT_SYMBOL_NS_GPL` for all exported
>   symbols in the sh-sci driver to allow RSCI driver to use SH-SCI symbols.
> - Added MODULE_IMPORT_NS for SH_SCI to allow RSCI driver to use SH-SCI
>   symbols.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

