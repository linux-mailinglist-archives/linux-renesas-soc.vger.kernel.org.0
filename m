Return-Path: <linux-renesas-soc+bounces-13218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E65F2A38383
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 13:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BB91173225
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 12:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7B121B8FE;
	Mon, 17 Feb 2025 12:54:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70161FCD09;
	Mon, 17 Feb 2025 12:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739796861; cv=none; b=dm/0zmH2YGaQVw8Q+fV0RerAih0skkuux0NPEJOaWlyro5j7fKvNtGGOx1MPWUpgIZFDnOL5tLdtxbvuryqMpKn0A+yLBHraPkrX5HEVx82hb800loD2HARvYHgea+xP1Z5A+ubRkcKe9VSxoslv2K42lN8cKkYHuv16nS2ffEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739796861; c=relaxed/simple;
	bh=rqrP6VFtF8SohgBnIBv7Pu7Pj6qh2In5FDRDJIUyJU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrEniLuF12II410BYUoslaiNcoKRjs3HZCqAVo7LRgro8UbwtzLGnHoboqDRok4uLBwtHeLIkBzIC55IBl6ONvnLdGVOsJigWE53wAwYiRZjjnrBDY8fsg4UV9790iTNCnGMsDoSn0xMYiIwMjm3MvXrppE3YJLWFwnIZBsLz8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ded69e6134so6252654a12.0;
        Mon, 17 Feb 2025 04:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739796857; x=1740401657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sy1aS+tBPBlRooFwx1utITPNqGAOTrJ/HwG7T+njuI=;
        b=mOQs5+2/Cd9F6diwFp/XyCd7BRvip2+HjlgIJ61LrzNSOBWrOkwIeKv2EK/RXMILjZ
         V6drxO+fLbnc197nzM1JkYeYy7AhkX6N6VRIBN4q/pvY/J1M0Zn3mONtl5G32ACXdpGz
         888KlxNPEtNpqoogH69JlHFVuarGo6U6IE7HJ6gWoyIoHC+jttN5tIYPNXWDB6rttIzz
         EPj8TqEB07/Ysf5lvkjm3ZunpTrVpdv2f9D9LCsPk24baezf7LFWaAJChBTvWCuh7ABo
         p+2qT0FeNsl9ASQUMcSQmLOk7ZVsJGDHxWBIBMPVDz+O0rl27lLJjrqPnq/GQNmmzYvA
         p4kw==
X-Forwarded-Encrypted: i=1; AJvYcCU85R5O/AHRiuRRNVPkTc79F8TEvkkZAPcYWWBtXZpNpVIkiCkY0NucTZO8TtVD0B2MNk9m55iSxzKQysyX3eVwb+M=@vger.kernel.org, AJvYcCUpq3FVZg0VFVRx2mRSdsl5B7sXqJRqHlNVT5sbFotR2JnWhdWm4/8KYFko6PNMY3iDcta/NojyU95CLNU=@vger.kernel.org, AJvYcCV07Np8hHwP/efzGN5sUmxVTF9hfJiCYyPnqF/ATDa1ScBkJCLhnzjQAzfmaZOkU76bhASuqEXhJ1XuD5Yb@vger.kernel.org
X-Gm-Message-State: AOJu0YyUOgwXaTKMsWnuc1JVI0ML1017+mdu9b9kRg2gUa1lIDhbCjsh
	uPK/gvlyWRqYvfQuqY6AEg9D0uh/F58G6/NwxVCyGRBX/XiXGPZ7tPG+AATJmIk=
X-Gm-Gg: ASbGncuRGpEtlZhASJf/c5ROFrlKqvTY2ODo3BrXq1S4iTWG/PdYJPb6gQfAMIc9r3u
	eQaUMMKveCIFK/kGgieKRIGW1T3FvLpLc3tBgeLX6+0GEvUCmFHPs5sQXJ/id+HdnhEJKVINluk
	6vgNDjFdnlt/UYLxUKipBXovoFMHGEr0ZG9BV+A9kOMXfAhjzBiTRWBip9VMXGc9bnYgR9PAHsI
	6z7VXJF7mkb8G7i9NYgJm4c0g3ao2nCulY7W7ZlzkdP21AN83k9rLwBcX/WQWjA16a5yJl9tTpz
	5x997K8flMOvh9t99OA3bXuVZUQinczdMx5AS6g8HD4cgQDRXGVH+w==
X-Google-Smtp-Source: AGHT+IEWz13IVdwEj4RzBRHFHA0RKmjaA441kUmVdXbG84dlFu2mN78+JMhlV9Tv/HJ/mBSZmx66lw==
X-Received: by 2002:a17:907:9716:b0:aae:fb7c:50df with SMTP id a640c23a62f3a-abb710e0cbfmr1032474466b.36.1739796856478;
        Mon, 17 Feb 2025 04:54:16 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba9bd6e3asm81392466b.58.2025.02.17.04.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 04:54:16 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaec111762bso995283666b.2;
        Mon, 17 Feb 2025 04:54:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCDDTjoa5KTNZy9UG/PjCp6WmJJB0+vT2jYjkJqWDLNdkYpFWvIaeeuN1DgUHCqwMXkpq9xYAP48ik5O39@vger.kernel.org, AJvYcCV85PgRIylijagrUiAGm0NR/N412p7B862YCWiFjS0UZoK7qs3AgjJuYvtyLB7sgDGzNaxFQshllB+svTpomIRqreI=@vger.kernel.org, AJvYcCXU6GOnJmg6cfaxBH55C6LIC4Ab/5ehEGRG+USCsZIMexIDSig4kaMmLRbfp4EoHvCMjMp9QwDXJyIvyk0=@vger.kernel.org
X-Received: by 2002:a17:907:7f27:b0:ab6:5072:6850 with SMTP id
 a640c23a62f3a-abb70bfd624mr953042966b.7.1739796855833; Mon, 17 Feb 2025
 04:54:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com> <20250217105354.551788-10-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250217105354.551788-10-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Feb 2025 13:54:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2TefCYPj+NctRhZKdxH4nvyWNGErt0v2qjnwWw11XoQ@mail.gmail.com>
X-Gm-Features: AWEUYZnh0zvHNpGAlYVrx_lKLntsZygJQoBX3KCOMXSoZUsDDQh_C-ahB0O1s-Y
Message-ID: <CAMuHMdU2TefCYPj+NctRhZKdxH4nvyWNGErt0v2qjnwWw11XoQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] serial: sh-sci: Introduced sci_of_data
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 17 Feb 2025 at 12:04, Thierry Bultel
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

Thanks for your patch!

Please rebase this on top of commit c1117a2fefbcce30 ("serial: sh-sci:
Use plain struct copy in early_console_setup()") in v6.14-rc1, so
it applies.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

