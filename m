Return-Path: <linux-renesas-soc+bounces-21280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E67BDB42266
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 15:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94F5F1BA1E8C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 13:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4D8308F19;
	Wed,  3 Sep 2025 13:48:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E4530AACE;
	Wed,  3 Sep 2025 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907313; cv=none; b=dJzExODjT6+BgXvVyc69Hs8aFIO73M+On/aO/pjbQ/EwlQ5F9rN57+mDFGnQeiCd8EOwJNnblSmIwX73u6RQjo2y6Ydt1d/0IUPrrUagZT9wjkGQyQuVdzcSL5a8yCx1MUr5VFHACtrTwLL4ZBhnu3dTW7Hw0bOr2Ug0DiECGYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907313; c=relaxed/simple;
	bh=R5IcIEOfbXQaDSSfczM01nDr+jxGJoWiCOLCe/6bJnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fS9gqJQnQ0TUkmpR0EV5X50EOD+NPddk4zIqdqBjwD5cInK894X593iTKJzlfaxdu/J9oBqAmkinoQ7zzCJ+4L6ncSehfD+1fw2Pn5t8eUoxSP7cG3pkWMe9ToG9fjqPbnJSn+FOxL+MwVXdTylRc7r+a7LuJvF7a81gIjTMI58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-52a5b6016baso3616628137.1;
        Wed, 03 Sep 2025 06:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907311; x=1757512111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4x8HmasTfhmB+J0MyYDWCEGz5QtDJVHDpJRdJEMVWjQ=;
        b=UKQtDgzuvJD3o+vETiNTFOXYzAiQVdXD/2+tfcxsGWn70vblMYkPUITDhT3vnwBoWD
         EWmqiS745YmiEfOXIuqtqAOGIYwWjT85A8EmMeDSkcN1HCdLmxHzvB1jgYl61IXykkfp
         hQAdV45/mr0Z31keufvLWYi8BF8V8EVxTpnJ6od4XjzqAX8Ahy32VncXPkyqZXD2X2+h
         LdO4Xqteupxrw5GQ0zQ9uADgiKk8Hel701SmGQ/Mi7sCgdhWBG30pR7Qbd3tdYHsLJed
         1Btb66EwOsmdgGY+i7/ujYmB428k8J6osE8wiOdWReNNsu1BtN4gp4g/4ehVDZDUiuy5
         MTKA==
X-Forwarded-Encrypted: i=1; AJvYcCU8rUCPR0Df1eXZPAT9qiJtDh1IQYeU5pfRlEXEytxmPIytKqni+/Ghv0XnlBwZ0m5/lAcqGoePsa62AFS5@vger.kernel.org, AJvYcCVFZrwuUNmgswMOwBugHwqVKPlKn6B3zzjga3o072x6ZrmwUsod7lasypYRbGYtzsZcrcpUN9l6cP07@vger.kernel.org, AJvYcCVmaCzWXwOBADzip0bjQab6iACKDyJAWHBgHjWSO4MeaD+woQS1zxYTGAs4ZtTKkft4aUx+S6AxNGihuWQ76yNwJc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjVwQdgyTPo+1LYZ23Plg62+1txWh2Iyuc7NLGgPoVG21rCBex
	4IZfAAVcRrFrC6aaNZkPAOGqeCIhBfsCb1nArCACK6X34tk9hHFMpJr8bi9+zyyW
X-Gm-Gg: ASbGnctPYJH7qxIvPzwzcwGVRBy4sPtHEpt04s9MYw0ZXDJUt0iCYgyhydRrqwHIuBF
	R3ohOQmsX8rwymvo8JzrdluzZyAOzdmi57DjlLmu9yvyX+0VKpjAb9xooUxjg9IqAQMn1agJEB0
	rctpULqwRPv2igz2S/LStYhlo6Jkhs6qgywL8VUI4skLqZV2B52/VTekmMjos/sgFm4m7c7t9Uu
	ojVy9+BwOzhxlHZeyGjby4A2aASntOqTbVbqcwz9qy9zI072sMUScH/s5W6qyhzq9FVSCj75Gpi
	9/wBvxjtSsPNV2a12DTrA4hcde+pzbZ6YipnRNrXAinlvpaAEyfwyNMhB7Fzu1CDY321s33qUoK
	c5cS8Z6IAGLsb/gbCkUnAYfzBIkPzrX9sLFd9285cqf7ft6OyjNtnplGKxZ5KYrx+b99bOEpNhd
	LDOchr6g==
X-Google-Smtp-Source: AGHT+IF+aVInYmXkRDZxdvCO9uHEJeHRTqxmwZe14LU3s+UHDlZgdcEOx1PTqiUeX5koJe229oSEEw==
X-Received: by 2002:a67:e707:0:b0:519:534a:6c3a with SMTP id ada2fe7eead31-52b1bb25c24mr5612615137.28.1756907310625;
        Wed, 03 Sep 2025 06:48:30 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af1915741sm5346127137.10.2025.09.03.06.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 06:48:30 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-89018eb083eso3028956241.0;
        Wed, 03 Sep 2025 06:48:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0LcYRwnEbhIHVuYB+rVZh1jQUPYK4V6fhenWQax66CPkmUawjr3U+30dsC6vQ+g1dC28OG8hhpZza@vger.kernel.org, AJvYcCUb6Mf63rBqLImeZCXuHCcAk92+deHpGfbWP5a+xTH//p8uUISmQvA7zsNbu9hlK4sRTYd7CEXmQCLSWxOn@vger.kernel.org, AJvYcCUxoaXntiPKD2zVXGtyGsoLEYgSCIb5t9w7Hd3DsIv5TxyrIlrpO8iPdZZGHxdHdL9AINuk3CEusPlNY4ZiHGSqpWg=@vger.kernel.org
X-Received: by 2002:a05:6102:5f04:b0:529:4cf5:8aec with SMTP id
 ada2fe7eead31-52b1b1edaa7mr5706136137.16.1756907310045; Wed, 03 Sep 2025
 06:48:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250821161946.1096033-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250821161946.1096033-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 15:48:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6NX+uvrna26ywnxFFd68WbG7czu6LmziJB6fPhge3jQ@mail.gmail.com>
X-Gm-Features: Ac12FXxgldkccsIT4O41Fwrjz2eJAdnriRY9FIho7y47-73daY_mVxBsWWnOK74
Message-ID: <CAMuHMdW6NX+uvrna26ywnxFFd68WbG7czu6LmziJB6fPhge3jQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r9a09g087: Add WDT nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Aug 2025 at 18:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add WDT0-5 nodes to RZ/N2H (R9A09G087) SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

