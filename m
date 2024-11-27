Return-Path: <linux-renesas-soc+bounces-10728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E184F9DA82C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 14:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41FADB21042
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 13:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0C819539F;
	Wed, 27 Nov 2024 13:01:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C431E4AB;
	Wed, 27 Nov 2024 13:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732712489; cv=none; b=YR6WBFlyxI5smJ3NJD3K0bSIIfIJx/VR7JpOGBTlJOdqLOiQVXM5LiyaO/1kV1Ch9AFZT0QOc7GtXe2IGqVKzs6ojT1yfJ6VPo6U2SVdKKl2WwQpIUlutD3pbF5AX0H+euPvGw9/3BirVd1iMwE3LIOidptXL+Lpto8F4WbN3mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732712489; c=relaxed/simple;
	bh=fwCat6iOLZksnlBkz4J+k4Oy4tAyUgihlWvYmbFWD64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O/Fkv5zynXIte5WgrHafYXTlJ8nON5mHLDmblJVY2pNET9CeOK62kHTTGwMEteQhN3MOHXcxniuDghQlldxg8drzmDxihW4f9rBd/8szpKFnkZ96t8HpwhiJkwgOo/0bdoa50iANvpUHIufRg6VTF8rPj3GCfVPac/oNB5QRoYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-297078d8eaeso4853071fac.1;
        Wed, 27 Nov 2024 05:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732712486; x=1733317286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ia/YcVLf6xUpnuxjWszjIdpvg2ssFJ896uOnlsg6PbM=;
        b=IsYekhSwmXLPVYFQ73gEc9gUDOAkz5E5AHgHarZ3YLLhQ245sdjwFaMauX9K3YHMm4
         aMXCyPlV+EkNTtnoCbj0rF2ADeH0WjsUP5+gfKnXQcjcjESFyfSxk+7ZlDfwx1xV5YPG
         l4uuloormdtFzBbGCVWT86f8dKSS99lqpdBuELe3af2n+U3/oLpwXEuu4frTAfEyXAJ+
         PDrFV9kgtO4aUMqqVPUOETru5TM0hwdZVcxCdFda+40kANH9Fsw13yeXIfTNzftf4xD5
         wxeFZ7w2KRY9nIsDxaSK6cMUy1Jmo28ao+hjFtGo8IGFh0n0VXrgmVkHFx96gfv5Dcgj
         QAOw==
X-Forwarded-Encrypted: i=1; AJvYcCVnteZ5KvzUruQa8ntZgjYrJ41Xhq9v19GJm0zbvRC0lWtf8VLiY5wOf8uQzVilmtchx/3MCYXMUD9AFMIP@vger.kernel.org, AJvYcCVpJlHkINrB/KHetG+5zeQxCTAmvJh8Oj1JSwSVqNlH3QHDESx3X0QTsu7tyYY1XRMcTB1HTq13Un0=@vger.kernel.org, AJvYcCWmpElY99aA0IU1az1oHRDcJwKu5UBNFsPEd2+yitu/CbniyyJwGuBdu9NcPoEDp3oEmU+9cZ2WetGShelMrR/AG88=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmsxO7KXRgonzyjNWCkf5QO9oTGGrRVDAiRgry7UesGZOYfuMG
	L1QIeX5H18mHmb0QqFxAp57IiY9EDbd7TnE+TOmqpOE7lKl22YXgrN7YOyHJbEI=
X-Gm-Gg: ASbGncsVSdNvjTqRFPGhxng7iyVJckhWYdgkXWV7vjHTW3KK7h1WHdy6ai4D3s4eFPg
	F/PLY17VhjM1JBAowwl2GDXAKHFnpGKMBafE9S0JifEEyaxA/J9Kbm2a9Ec3RXVE9Z17L44fq3f
	rK0F23m+XOYluljYtzeoG/H+G81SNrdUaqw4kt4hDHrDfn0jWD/E9bA2AQHOyveIZRMJTFC2231
	6Itwgyz+0JDCyPZaQEA9kuNFPP5IIka49QVWhULz4jWr7M7FUimebYk5nIH/Y5Jj6g12wV9I9bR
	1ehV8Dl6ADYk
X-Google-Smtp-Source: AGHT+IH9iDijpSR5WzR2933rtX64qVY6pG1rRgSLBBXmts9T99UoCvRSsyCBJ7Q1wBest5M8CPOtVw==
X-Received: by 2002:a05:6871:3a07:b0:297:2727:91be with SMTP id 586e51a60fabf-29dc4305d00mr2690278fac.27.1732712485943;
        Wed, 27 Nov 2024 05:01:25 -0800 (PST)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com. [209.85.160.43])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2971d5ebbbdsm4848351fac.17.2024.11.27.05.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 05:01:25 -0800 (PST)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-297078d8eaeso4852989fac.1;
        Wed, 27 Nov 2024 05:01:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2xvq4Vh0L4UJlGUgdg9D5cWMSLt7PF8LgcbAleeOK/nnmtCQX8AT8hTE8UbI/z9ZnZgUXFYwW71xx4SEf@vger.kernel.org, AJvYcCV66HcCyIkE39N2zhrzIz79c9I3zma8qrxll6ikw2pD3DPYaGe9iUQA8OitiOxxouXnq68DoBfR9P0=@vger.kernel.org, AJvYcCXWUq9exp+UbwfwQtv5TSzmJUm3ZtLyddBr6mELrSfRYaBNInaSKJ2G8uXiQZFQVCnHquwi/onr0ZhkqrItDxOBzHU=@vger.kernel.org
X-Received: by 2002:a05:6358:7184:b0:1ca:8d64:3719 with SMTP id
 e5c5f4694b2df-1cab15d0b1emr180778955d.11.1732712484823; Wed, 27 Nov 2024
 05:01:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031-clk-renesas-cpg-mssr-cleanup-v2-1-0010936d1154@gmail.com>
In-Reply-To: <20241031-clk-renesas-cpg-mssr-cleanup-v2-1-0010936d1154@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2024 14:01:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+bvYQoOLxZ_eVRN2F604k1saJs5vbCLug0BmhVnKx3A@mail.gmail.com>
Message-ID: <CAMuHMdV+bvYQoOLxZ_eVRN2F604k1saJs5vbCLug0BmhVnKx3A@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: fix 'soc' node handling in cpg_mssr_reserved_init()
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 1:43=E2=80=AFPM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
> A device_node reference obtained via of_find_node_by_path() requires
> explicit calls to of_node_put() after it is no longer required to avoid
> leaking the resource.
>
> Instead of adding the missing calls to of_node_put() in all execution
> paths, use the cleanup attribute for 'soc' by means of the __free()
> macro, which automatically calls of_node_put() when the variable goes
> out of scope.
>
> Fixes: 6aa175476490 ("clk: renesas: cpg-mssr: Ignore all clocks assigned =
to non-Linux system")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Changes in v2:
> - Squash patches for mainline solution without intermediate steps.
> - Link to v1: https://lore.kernel.org/r/20241031-clk-renesas-cpg-mssr-cle=
anup-v1-0-628274ecbfcb@gmail.com

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.14.

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

