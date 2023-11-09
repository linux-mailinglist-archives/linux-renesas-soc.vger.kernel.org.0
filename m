Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 212287E64D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Nov 2023 09:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbjKIIAZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Nov 2023 03:00:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbjKIIAY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Nov 2023 03:00:24 -0500
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496012715;
        Thu,  9 Nov 2023 00:00:22 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5a7c08b7744so7180907b3.3;
        Thu, 09 Nov 2023 00:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699516821; x=1700121621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R60uGQl/nGeZjkDEsodGckqWXW+USFr7sz7RLj2b6RQ=;
        b=SLf85QzII5eN+Xg+ucU18pkDkJ2jKOVA2F2ka6XZbBZJZLdl+6lVsn4DS2aBMKDRLa
         oCClgdG1o92wBrn4FZ/W8aspY7SPOCF1FrKejmRzM8J9Gzv54ZCNx5z2UTkHLa5LMHw5
         AOxtJREy+wL8kw/EhQBRBh2ZdKMyDTb8emNTMsQGKV7VzeV/i9d2szroHjmVRzs+diVT
         VQoAS0sTgD0mztSjS8PyiJz11mf5qi8Nx0R31aRrHmaQ+8A+Q0PZfN+zElof/d5hdoiA
         PtcEaeKhV4BbXzTPGEKwOeqARruSOeHJsjxOB/bZkwIbg/pXDgMD6p0avOF/dZycQCq2
         KbPA==
X-Gm-Message-State: AOJu0YzIFSZeUC39ajYoshj9ngdUw3w4J2ThdASOR2ypL+9QR4SRGIvJ
        lWSCA0/FEqgsinl+nyFTfcLTBBDQJ2eJzA==
X-Google-Smtp-Source: AGHT+IFbkoQhrktQgmanPhaHbB8XY4wED6I/RjXQs/76LfPWcDZEfQ3AyU8OORTImAOqUbFdZvAqrw==
X-Received: by 2002:a81:49d0:0:b0:5a7:ab45:539d with SMTP id w199-20020a8149d0000000b005a7ab45539dmr4140899ywa.2.1699516821315;
        Thu, 09 Nov 2023 00:00:21 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id g200-20020a0dddd1000000b00583f8f41cb8sm7781075ywe.63.2023.11.09.00.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 00:00:21 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a7c08b7744so7180827b3.3;
        Thu, 09 Nov 2023 00:00:21 -0800 (PST)
X-Received: by 2002:a0d:ff44:0:b0:5a7:cc48:208d with SMTP id
 p65-20020a0dff44000000b005a7cc48208dmr3625498ywf.5.1699516820874; Thu, 09 Nov
 2023 00:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20231108172232.259301-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231108172232.259301-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Nov 2023 09:00:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWWgq=gnM+h-GNwvFTxZFXWTtsx=+LFJ1-cwbLi0GXJEw@mail.gmail.com>
Message-ID: <CAMuHMdWWgq=gnM+h-GNwvFTxZFXWTtsx=+LFJ1-cwbLi0GXJEw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Enable 4-bit tx support for RZ/{G2L,G2LC,V2L}
 SMARC EVKs
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Nov 8, 2023 at 6:22 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch series aims to enable 4-bit tx support for
> RZ/{G2L,G2LC,V2L} SMARC EVKs.

Thanks for your series!

> Note:
>  This patch series doesn't have any driver dependency as 4-bit tx mode
>  works fine with the latest renesas-devel and linux-next.

Can you please tell me why there is no longer a driver dependency?
What has changed?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
