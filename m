Return-Path: <linux-renesas-soc+bounces-495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 432408007F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 11:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9AC5B20FB8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 10:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EEA81C6A9;
	Fri,  1 Dec 2023 10:11:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED0384;
	Fri,  1 Dec 2023 02:11:28 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5d3d5b10197so9943577b3.2;
        Fri, 01 Dec 2023 02:11:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701425487; x=1702030287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4C8ps9IR9RDt6FA4GKz0FWqJd8X49zk3Wo87ga7yHog=;
        b=D3n7WezcvN2fxvjPyFnUm1tYq+Wm/5DeyOfpyfWZFZCIUctqCJJAocq5mfEYCOkckF
         /UN60uH5y7jPd5aGghjJkGKqdegzKzH4aK5GV8EKqQ8aGi+svMNpKZTaiXj8Q2Byin5A
         FMg+IFOv0apa9kABsXXixgjzPAB0X++bauaFGAWC7709Mml7Qby/QxTS5CsL3jQ6N0Yi
         4QOdT39gzXNxC4B+WAfy488/ctKVqIw39JBTJUhCQ7izINldtc92zcupi6DBLSFXys3/
         /CrYvd9sztpp8kD+XqZEoHa0B0rLDV7QknJRuf3kcboTywL4nfYeDSVY52N7gX26QsZd
         J5xg==
X-Gm-Message-State: AOJu0YykoKXwXFoqKM8vjbBoHmyqhl2WXisdfJhommcRrgmJqqU4wyj4
	IuDPgLC0grMCt4v3dEFTTnTn9LG416cuIw==
X-Google-Smtp-Source: AGHT+IElXPkFQv2MRqcGz/dqUx//URpIDYETobdWDnEhnx2SYHy3VxLZzE752GvnAyHgPw9wHD5w8g==
X-Received: by 2002:a81:ac60:0:b0:5d4:3596:5ace with SMTP id z32-20020a81ac60000000b005d435965acemr848286ywj.12.1701425485244;
        Fri, 01 Dec 2023 02:11:25 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id s127-20020a817785000000b005a7c829dda2sm969144ywc.84.2023.12.01.02.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 02:11:21 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5d35a952943so16722067b3.3;
        Fri, 01 Dec 2023 02:11:20 -0800 (PST)
X-Received: by 2002:a05:690c:f83:b0:5ce:4bb:832d with SMTP id
 df3-20020a05690c0f8300b005ce04bb832dmr22433792ywb.6.1701425480657; Fri, 01
 Dec 2023 02:11:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201054655.3731772-1-yoshihiro.shimoda.uh@renesas.com> <20231201054655.3731772-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20231201054655.3731772-2-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Dec 2023 11:11:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeVjV4kYvxXM+5TkVxGp91gCA_K9RW6+B8ugKbEd9K-g@mail.gmail.com>
Message-ID: <CAMuHMdVeVjV4kYvxXM+5TkVxGp91gCA_K9RW6+B8ugKbEd9K-g@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/9] net: rswitch: Drop unused argument/return value
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 6:47=E2=80=AFAM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Drop unused argument and return value of rswitch_tx_free() to
> simplify the code.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

