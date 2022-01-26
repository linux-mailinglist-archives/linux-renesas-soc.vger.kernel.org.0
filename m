Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7F4549C977
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jan 2022 13:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241179AbiAZMTw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jan 2022 07:19:52 -0500
Received: from mail-vk1-f173.google.com ([209.85.221.173]:44674 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241178AbiAZMTv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jan 2022 07:19:51 -0500
Received: by mail-vk1-f173.google.com with SMTP id b77so14210708vka.11;
        Wed, 26 Jan 2022 04:19:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YkYaHw8KMQ/aJl7rjcIwU+8RnG6ZAK/ZJXJMbriBYp0=;
        b=S21L4y8gSi1nZs+4xlzlCFy9mufTMSdZ7bMZKbbwy5utFrZRBNj2ipOFm6HObpojpC
         lMBXFkmUJ76suGFNlvq/c4n8Z+NNEyffUlQu+lcakY2cr45ssLnVCJdu1pvjRlWcYAbX
         frOSWJtAVy0a09TBivogk8Tr1Z2cjDA4cjDB5fWnJIznW2CItbLCNbvcc4byVy4ApvrT
         to8MVXjVrLC+xb+5qXakfSOK8fgBV1+coHjswAVPIYrP1rhqkY81iuZyxkpOyoDgXkKo
         cZGsCbYOmYfDBQ9ri29Wh/3T/aqg3YDczFmBLCO6aoGSkKhFT3nmugdsYpPhO4TxM923
         RUuA==
X-Gm-Message-State: AOAM5314JrOQhODfN7t8bGl2O0ix9bxACJkV5dhIddGwx1wIDBXeCG1d
        VYAMWVEksljQ5mGjEOL1/FcYFdfmcbckr3yA
X-Google-Smtp-Source: ABdhPJzgMmgHOkZZq7DtuKOuQcRrMNFShw9a4+feFpo4GaKIiWuB6dhFspLkHwRVX1lCxccsWW1UQQ==
X-Received: by 2002:a05:6122:1313:: with SMTP id e19mr852105vkp.28.1643199590957;
        Wed, 26 Jan 2022 04:19:50 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id e13sm382832ual.17.2022.01.26.04.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 04:19:50 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id e17so4166897uad.9;
        Wed, 26 Jan 2022 04:19:50 -0800 (PST)
X-Received: by 2002:a05:6102:a04:: with SMTP id t4mr3996014vsa.77.1643199589945;
 Wed, 26 Jan 2022 04:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com> <20211229193135.28767-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20211229193135.28767-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Jan 2022 13:19:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXcQUwW86mEq4gg0eUBS2H03SeUHCVF1hn1ekWjt0OE_A@mail.gmail.com>
Message-ID: <CAMuHMdXcQUwW86mEq4gg0eUBS2H03SeUHCVF1hn1ekWjt0OE_A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: Add panel overlay for
 Salvator-X(S) boards
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 29, 2021 at 8:31 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The Salvator-X and Salvator-XS boards support an optional LVDS panel.
> One compatible panel is the Mitsubishi AA104XD12. Add a corresponding DT
> overlay.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
