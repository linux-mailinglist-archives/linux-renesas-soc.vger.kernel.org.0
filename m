Return-Path: <linux-renesas-soc+bounces-21-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B6D7F2803
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 09:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E41801C20CE2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 08:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE6E200C9;
	Tue, 21 Nov 2023 08:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99F8695;
	Tue, 21 Nov 2023 00:51:44 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-db35caa1749so3202310276.2;
        Tue, 21 Nov 2023 00:51:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700556703; x=1701161503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6FwsP0d/s2+vb8ZPGZp83o6o1L3SdqgmLIoycM6b+I=;
        b=EVo2LbrKkeTjfOlVCyPfgcySWTF0+Vi6AbFG4kOTf+m0qHSfMnGR0c9wc2IJ3Vsksb
         dz8GSyISRlPuDy0L0o3FdG4KcNjrDhe+zJjBVP37othU6+OJ7TfaQekwmS61h7ZMoIfh
         u2QPj1kTaK4kC1MhUjpbV6iEPKhL1K3TpJOCmaQl82jkTkFtJrVpG+HLFevsoJgEP7J/
         ZvHTvxr9BN6AKrpSm8vZRFLXa7UHd+2o8VWhfLcVQUPSST5WS/syPU/2sJW9QgVUN0Bf
         tpgsnXOHRGC/cduuPGpScNX85PAbuse7QiV3p0hWVAOclE4j30+wzkj6MG7ynEm1+vDP
         vDQA==
X-Gm-Message-State: AOJu0YyTLQCa+A2fbEvWbysf3aaVjreVO2AyI9OL9xqkQQ1ViC5+kF7L
	5nFG0zW6KFBTXoslBZpf0Ag9qyDBGwuPUVpM
X-Google-Smtp-Source: AGHT+IEhHRbWmjbMwFlok6Pay+3O7jeei/IvDn9kFtRyk45TD6t5+BZ0SWPaoXrFQTbhy+64wC3dmQ==
X-Received: by 2002:a25:d08b:0:b0:d9d:8fb:d29f with SMTP id h133-20020a25d08b000000b00d9d08fbd29fmr9509387ybg.45.1700556703615;
        Tue, 21 Nov 2023 00:51:43 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id j4-20020a258b84000000b00d9a3fe483cfsm546038ybl.23.2023.11.21.00.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 00:51:43 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5cb96ef7ac6so4042187b3.3;
        Tue, 21 Nov 2023 00:51:43 -0800 (PST)
X-Received: by 2002:a81:b283:0:b0:5ca:8f0b:8c63 with SMTP id
 q125-20020a81b283000000b005ca8f0b8c63mr5009768ywh.43.1700556703014; Tue, 21
 Nov 2023 00:51:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231022181910.898040-1-niklas.soderlund+renesas@ragnatech.se> <20231022181910.898040-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20231022181910.898040-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Nov 2023 09:51:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-vZJTj+kC53L31cHqewq1fKhLS-MT--GUurPkLf4GwQ@mail.gmail.com>
Message-ID: <CAMuHMdX-vZJTj+kC53L31cHqewq1fKhLS-MT--GUurPkLf4GwQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: draak: Make HDMI the default
 video input
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 22, 2023 at 8:19=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Most Gen3 R-Car devices have HDMI as the default video input source,
> align Draak with them and make HDMI the default.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Split moving the incorrect bus properties to separate patch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.8.

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

