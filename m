Return-Path: <linux-renesas-soc+bounces-17903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81454AD0222
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 14:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 346F03AEC8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 12:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02DD288C05;
	Fri,  6 Jun 2025 12:22:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D6E28851F;
	Fri,  6 Jun 2025 12:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212526; cv=none; b=NMKWqAMB5FyJvIJh83jjPmckXhpuPu8O1ew7QOg/CN/q5ldL1WvgMhndfk03ZSZEXTEwUdTMNDGhOVIOvyViLkCBUUiF4EULPW5qbuTFBE31WJCUiJC2+C9XaxAtOQt/Y8eye0KQN5zWB5JSoKZlyinDME5e8AhXPS2+xVbcZ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212526; c=relaxed/simple;
	bh=0U4sLN2bU3FPPQbIwWvuKJBqBIiIXtFnOOChN9lQMko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajhAAOHlrhvKEDjqFk9ch12bkHVg2EQ0LOLxLt+oxLNuy0FveafWuTN/8ZcnQnbM4AUWFZEWMZNmgjYogRFZZfLAMsMThwZqFMaGUQkVPh65oHVHX322raZiBiQVYKtfmcDTt5R3HsTg8NMKiYaDDOTwBjHpDz5E0tDlIhFRLTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f8a70fe146so38353076d6.0;
        Fri, 06 Jun 2025 05:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749212522; x=1749817322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bq7rC4bOsVX2kPJWiHscsX37vABLUWxhZKEGhe4C/Q=;
        b=eq9KNJjvZHxQKEtIqiNZ1/u5ns241dVWKcqk/+758wOmzJ73efVmvmR5U1LyFJtGAB
         J+94vehUaN0Ef3O5MGczduglh+cenouvDhv+i+Dq0J0Bclku8+UJZbIEw8lZsHEsr4mx
         PesG0/DB0TgWmqznsqI0ro8xY6M0eERP93L0ViAdJBvK69nXl4rSbbXmKoKgYl2b5tF9
         yPYd/1qTYkx7p7/GDweRZQGJQ5ajpDYZm3hDTbAhRjooVnYG8l/c2UEwkFmLjMzjkFwR
         kwRXOeHa0G3goCrIG6WsuuuoJ0XDOUMfSMZEqa0XpaoUfMz48M+/UC5LWt+1cssHgrXO
         Hozw==
X-Forwarded-Encrypted: i=1; AJvYcCUT/KBr8GblQTU/Bo65/hAfN0S7jU1Om3V+Zu2YMVTOP8/CIsjWlfO0vovyvmLbyZNd/W13GV24@vger.kernel.org, AJvYcCWFarctNwtFqVoNiVd2rTLVY68bFx1np2PbF/yV9bRmOyG9hMVRPKKCGqvDL28tCst3taciKmIKW4W6@vger.kernel.org, AJvYcCX82a8eZpf393kI5GGkuvULobMa+sQkc8BdAQjshKB0PYzJ+LTn6UzILGQ22dRQsPxA+zHkLKLi2kEczmcr@vger.kernel.org, AJvYcCXq4imeOZBCel11mccgVb5cpcTHViVFyg0+A4Ahpbk3mVrz4KtmgOonUjnUUBcMIwjif1BeXLbO3KMEfbAGtb474II=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTgQmcoeeXlhReoEWlfHMYDoHPDgYdfx957OipKWQD4h0Bb11s
	KA9N5j3wiH+gZK8hQYwMlg+B1UfxeGs3i9Yi/dvWnzOa7bnX3EYXP7FloQrcSOLr
X-Gm-Gg: ASbGncvsh5SJEr83+n4VTeBZX8kPI9/xnemnkIBtQuZulIvGDNKQkJNdUtD2pw8UYki
	43msTdFrueyxsHBecMOPOXIle+FrJ6pJIEWkQQbbT8IHpZ5WdBA7Cw8P6XsSHiMIi9ZxIzobC2m
	WbDmNI4fhV0d4m/49w6tR5IyiNDilP7c1AyvcObFRQx2hnIKjviHW5vDiC23LeEvo23oHTyyFhU
	yGQw9ZHolPhfVEIn9zmiWNIZXWDKviwo2moxALDSkc0toseYU+E+NRpcpW7nTag7BZB4knw1CvY
	YsHxIIyvRbOTQlvkkQbBRlul5O2AXZQcn4k7DcmoyvQaICjQwpkfJ1+5G/E1BevkC21T9uJVB76
	91cAVmmS/2Bzdp6aygw==
X-Google-Smtp-Source: AGHT+IHh27C0wXWCvQjI0URpPMFiNZfzas2u4sgBp0/x1gtLIqRUbD5MFvUNms09tDp94gSqfBfjVg==
X-Received: by 2002:a05:6214:4106:b0:6fa:cb97:9722 with SMTP id 6a1803df08f44-6fb0903b447mr52363246d6.34.1749212522360;
        Fri, 06 Jun 2025 05:22:02 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b366easm10358756d6.114.2025.06.06.05.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 05:22:01 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a3db0666f2so43409281cf.1;
        Fri, 06 Jun 2025 05:22:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9WCl/Wn+4av92BcnpSxnF9Z+kpk7tuvR03CnfeNQk9goBgjdoN14hcfVAxANhp6iAgEoW8IrthOuAUa+t@vger.kernel.org, AJvYcCWI2nIVUNphSnG3ROHLkjEGkIWamuDNy+ZKO44IJHuNqOZ1WUtEUFHQxDvRNtzjyD+WY/wYMfLj@vger.kernel.org, AJvYcCX2Ivk6gXwPUc0RUB349xilBE3rz650jrsfk4IfLp7I/jKWxuPaltcxTPt4eaKsnu/RX8GBgc5SijMM@vger.kernel.org, AJvYcCXU8PTvR+LcnaHiobQL/saL25kw473NytFmC9zzhEf4PD7/iSnwy3mph15chBRSkYUHKCqX2ADyC/EkiLSWpgJfhIw=@vger.kernel.org
X-Received: by 2002:a05:620a:1030:b0:7d2:26f3:83de with SMTP id
 af79cd13be357-7d2298ed2c8mr465034285a.54.1749212521444; Fri, 06 Jun 2025
 05:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604065200.163778-1-john.madieu.xa@bp.renesas.com> <20250604065200.163778-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250604065200.163778-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jun 2025 14:21:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpKOZLzvZAAfzMe=GrStqc1bX9WRy-ROdrRkLzXs4iOw@mail.gmail.com>
X-Gm-Features: AX0GCFtvoYugcH9OSDokLRpIxzWObSPzAwFWFg1APvof6NKzfaRHx1oY0ZfkojI
Message-ID: <CAMuHMdVpKOZLzvZAAfzMe=GrStqc1bX9WRy-ROdrRkLzXs4iOw@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: net: renesas-gbeth: Add support for
 RZ/G3E (R9A09G047) SoC
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, biju.das.jz@bp.renesas.com, john.madieu@gmail.com, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Jun 2025 at 08:52, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Document support for the GBETH IP found on the Renesas RZ/G3E (R9A09G047) SoC.
> The GBETH block on RZ/G3E is equivalent in functionality to the GBETH found on
> RZ/V2H(P) (R9A09G057).
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

LGTM (I don't have the User's Manual Additional Document for RZ/V2N)
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

