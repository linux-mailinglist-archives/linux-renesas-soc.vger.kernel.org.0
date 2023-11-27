Return-Path: <linux-renesas-soc+bounces-286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7F97FA207
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 15:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DB74B20E50
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 14:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874F830F9E;
	Mon, 27 Nov 2023 14:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885E05B89;
	Mon, 27 Nov 2023 06:09:08 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-db406b5ceddso4129670276.0;
        Mon, 27 Nov 2023 06:09:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094147; x=1701698947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TclnUxt+Pe57f4VMcCrdiPoEHOSxx9819gRSBIhIC88=;
        b=wmIn48sBatzJ1f9ElX48hSuiq3qHHRl30LyoSpTmnUbMttiegtxidCseRNVvk8lZGh
         TOyONOsqcv0R3z0IkBaB8r40uQ4uKygYeUR8I72GIMjBkSDbT+HnB86eS8Ga+YFm3ffB
         nL74jR7WIx08klE3YbL1LAeveqsVizqqwJWX58Y7yhknePbVfyPWuHQ9eBq7GlyaYaZl
         YADYnDSl/mN/jX/gSTe8i7C6jniTJsPF/dYTtWkaJNl0Epy/Z+G96THAIsdoBK+ac2zr
         moB9l8e/Xpga2qzEg43g3VS+K8kTdVk2H1tdO69SKo+4Js4pVdRN3pEfyt+cFM5coKlx
         uhZQ==
X-Gm-Message-State: AOJu0Yw1dLZXIGtraNRnPQsk3kOx7gTSk9DbgeQ9C4Bxd/Kaj/JAZwxV
	RDdjlhbZttVFCYUf59NNYjPS/lLgQgqRgQ==
X-Google-Smtp-Source: AGHT+IGgJnwbRYRl3xTtJ+fOfoWlQW3RkyiNHGAq3JEZ765CEOex2A8NnN5ZbDDl1k/YW5ByolPnBA==
X-Received: by 2002:a25:8d04:0:b0:da3:76d7:ddcd with SMTP id n4-20020a258d04000000b00da376d7ddcdmr10115524ybl.17.1701094147558;
        Mon, 27 Nov 2023 06:09:07 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id l131-20020a252589000000b00d72176bdc5csm3055856ybl.40.2023.11.27.06.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 06:09:07 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5cfc3a48ab2so11676357b3.0;
        Mon, 27 Nov 2023 06:09:07 -0800 (PST)
X-Received: by 2002:a81:d549:0:b0:5c9:9097:6427 with SMTP id
 l9-20020a81d549000000b005c990976427mr10948746ywj.44.1701094146938; Mon, 27
 Nov 2023 06:09:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231125233242.237660-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20231125233242.237660-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Nov 2023 15:08:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgaavWyq9WDTcnqAUhsDZT7XfaoY2sBFvXvCCegqBgsQ@mail.gmail.com>
Message-ID: <CAMuHMdUgaavWyq9WDTcnqAUhsDZT7XfaoY2sBFvXvCCegqBgsQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g011: Add missing space in compatible
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 26, 2023 at 12:32=E2=80=AFAM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add missing space in compatible property and align style with rest of
> the file.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

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

