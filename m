Return-Path: <linux-renesas-soc+bounces-15171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A4EA7667E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 15:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C29D1645B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 13:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0E3210F5B;
	Mon, 31 Mar 2025 13:04:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C731136352;
	Mon, 31 Mar 2025 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743426286; cv=none; b=ukNxMtAIKmfzd+GeKjkFkuhEBPYpHNeoBD4H66nhLrc18RBRIhNGUMNKgpruEDhzjeIatG6Y4Qek5SaeQmjkJNvrCVcRXW/Q/8SHYsaiajhqDxf7HjQy265b2NpTYI9ftu6XW/4ZGrdWuIdvQ8XsU+Terc3w+v9fonoopH5wC1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743426286; c=relaxed/simple;
	bh=5pBKyfs5ydjSGE0FAfJU2gjlQPilPd34X6OLvjZIfLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JpePbxFjUCuyhQYFmk9fkTgdla+mzDFjAWUGjkDBxV3kOmclFu3QveMhPbVnoH/+MdPmWlrhxv1kCZvzlE3KJGCDTY2mduzFQl6rTkWoSybGVR8F9xqC6rbjIGRdgLNCbWDo5DWPXBXRvVAJEXxHphj+ab+D7HwjkLzVpi+4y8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4772f48f516so54280741cf.1;
        Mon, 31 Mar 2025 06:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743426283; x=1744031083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJyRq+VELZtGHhkQvSg3KmhPVZuIPfea8J9xyGQ9e/0=;
        b=kXJUiGQw0XvsQ5HgMYsK7Qc94AhIBwT61x5DEj1c6EiqgHVZaMUlDnFpQmtWWs8mu6
         DC9XQpn7JAbhm6xRceDsvaAq8PzlnxFxB+blK+PLWkqeFmnYDLOdPUq5h8/fgAQklu1k
         SmoFD4CLBPv/eZ33fSB+tYmgZWt3gvFjI25JxpqZp6O/O1IaPTRf2uJzddkOYR+o2cwo
         OHWq+DCTbqJdfe0M+nGIuj8u14d0gtN9jVS7WiCG9/D0Y8s4iiHhMItSm2UZvqC8SSlA
         FeD02erO/szmBUZiJjSKoIrPzSFfo1mVc/U4Jv5yRm6/sIroyOaoJyLUa6NCp6UqJ39a
         KUsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2LMbKjJi3vVmTZSlEMcC4qLTQCtYw4KOyH9FU6hmtxsIOvfSucWcSNZw8m7MWyUxEhU+JGnYFv06KPfP3@vger.kernel.org, AJvYcCU53OIIs6FBn/aQL7+wXfAvvw36X3XCS0pPUTmvtmte8XKD1MEr/w2aufUacssPVPbZeMPL6mBdpt0OG0xdQMsyO1k=@vger.kernel.org, AJvYcCWOr8pkvEMIwt8VXDHgt1PKHTaKEpEgD52LjaCQcjQSZi7zYSGH8H0biFbDJ4xYphWtyy+jajLfMm3m@vger.kernel.org, AJvYcCXneoI4HgGS57TIdUkorQlg/JEIjaCNYVxYF6X+alrWx+L3UydBtHX6LI+r8ZqeFJKSYEu786Y0FmHxPT9v@vger.kernel.org
X-Gm-Message-State: AOJu0YzP4+Ubd3jfsE4CiumbKj2Uel2eh6O5K56Plw3R1KhVWTbSk69n
	TUAqxpBT3xx+KopGX1cv/W3cIul30GV7PQhA9C7tRon3URlEOg6Cu3aF6TnF
X-Gm-Gg: ASbGnctZMGkbqAtAg4mJnXv890p5ea38bjWA1z03Lmm8w9FnIPtuDso0tjix+RM96RT
	tzTga9mGQNMCYGUoVNb5m1SCZEZ9DSWprkLDJ2oJIb8t452pABxWvXYYJ85s/Ilka6IGN7+hj2e
	9vzIl1MfRKXSY1WODkO/rqnyG5LXIa35bv16eycZHSFkdQmp6cmQgQ3YwQhWqZE7LenS49H2hiW
	mS8+updBsL9iBoHP+JV+DzXhOJ7+17IrRU3A2YIiTKhWTqcyX/2OKnPhJ7ijn9nHKUb1jo2uln6
	sTDPn4q2ix9jWFWgBxnlhav3usqJvtEZvfxzB/3ZPbzD7DiFTanoA5EuL3eFJ52O43EbC04R1uQ
	pQMrb5RKUvNF+tmdkZX5uNA==
X-Google-Smtp-Source: AGHT+IFSD940oOmqqEW/5AbmT2YxGP3i1Wet/uJUIw9zQ8EkOwXDD6UlnC8nxQ5WZRHOnGF3EiYw7Q==
X-Received: by 2002:a05:622a:3d1:b0:474:f9f2:ecb with SMTP id d75a77b69052e-477b3b2e63bmr135576191cf.18.1743426282709;
        Mon, 31 Mar 2025 06:04:42 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a82e53sm51236321cf.48.2025.03.31.06.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 06:04:42 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c592764e24so467952185a.0;
        Mon, 31 Mar 2025 06:04:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyoP5f3saKXR2PGiZumes6J1JS9YEQo9vIbQLoSHcIMiCehG0fPK3rcofFPzdB2g8iz56KtOWcQxap@vger.kernel.org, AJvYcCV6vO+Nvfgj+bH5skQcnfNfOkhnvvqmeIF5QtC7L0B3KU8wjvhG0IrPaDZzcLy4C4ShytuSVn33VY7F9sbUmq8kTm0=@vger.kernel.org, AJvYcCXBrPCowqlny4q+9AykYzh0R0L5KclSyr3R4R1GlYuiVHWHKBi8zejU4Qeeiy0Xbcfy4mHhCOXMHSmvdQwn@vger.kernel.org, AJvYcCXpDyVtevDRfMiznFrRcNoUJCaq5c1clo6KzeoGlTFXBWyDBvBo9Myv0alKmBe2wnwTQEtrskZJ6LyCQ2EW@vger.kernel.org
X-Received: by 2002:a05:620a:a117:b0:7c3:b7c2:acf6 with SMTP id
 af79cd13be357-7c74c37c711mr780538385a.15.1743426282203; Mon, 31 Mar 2025
 06:04:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331122657.3390355-1-thierry.bultel.yh@bp.renesas.com> <20250331122657.3390355-4-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250331122657.3390355-4-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 15:04:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXeAueSWf50OhTnCxu3tFq6Rq8YLJ=r67WDnOfv0Yv-oA@mail.gmail.com>
X-Gm-Features: AQ5f1JpAzFosInwQHkXagNFZ_7VJ5Dc0ptxzN17AlOfd63aZFjeiD46nOdELNQ8
Message-ID: <CAMuHMdXeAueSWf50OhTnCxu3tFq6Rq8YLJ=r67WDnOfv0Yv-oA@mail.gmail.com>
Subject: Re: [PATCH v6 03/13] dt-bindings: serial: Add compatible for Renesas
 RZ/T2H SoC in sci
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, Rob Herring <robh@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

Thanks for the update!

On Mon, 31 Mar 2025 at 14:27, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> The SCI of RZ/T2H SoC (a.k.a r9a09g077), as a lot

RSCI in the RZ/T2H SoC ... has

> of similarities with other Renesas SoC like G2L, G3S, V2L;

... with SCI in other ..

> However, it has a different set of registers, and in addition to serial,
> this IP also supports SCIe (encoder), SmartCard, i2c and spi.
> This is why the 'renesas,sci' fallback for generic SCI does not apply for it.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

> --- a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml

Given we're now using the "RSCI" naming, I think it deserves its own
DT binding document.

> @@ -9,9 +9,6 @@ title: Renesas Serial Communication Interface
>  maintainers:
>    - Geert Uytterhoeven <geert+renesas@glider.be>
>
> -allOf:
> -  - $ref: serial.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -22,6 +19,8 @@ properties:
>                - renesas,r9a07g054-sci     # RZ/V2L
>            - const: renesas,sci            # generic SCI compatible UART
>
> +      - const: renesas,r9a09g077-sci      # RZ/T2H

renesas,r9a09g077-rsci

> +
>        - items:
>            - const: renesas,sci            # generic SCI compatible UART
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

