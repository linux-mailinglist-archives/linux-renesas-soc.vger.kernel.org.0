Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C06142C328
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Oct 2021 16:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbhJMOat convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Oct 2021 10:30:49 -0400
Received: from mail-vk1-f178.google.com ([209.85.221.178]:36362 "EHLO
        mail-vk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbhJMOat (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 10:30:49 -0400
Received: by mail-vk1-f178.google.com with SMTP id f126so1914626vke.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Oct 2021 07:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hCM6p41sc2+QLQ3uEQi9IZxg9GZWcyF9EIU76x8Vm6M=;
        b=n1R08XcdJIB1o1WUDJaNei0xs0tOa4KnKx5GHm0C6pXNJXFfPe+GEKnrpxdPCwmmS8
         pSOVVZJqfN1X7QXXoRqHt0/Q+11VP7pdVBQ3RW+fMUH0HqdswRpnefSUdwc25znGf5xQ
         CmlA/GCygnMz7EANSY/YES3qHUl66jMXSOg3zWL8GjY0q/bjzMQssN6NghQGIu+xoPje
         FEeMLm5P3okKAw7FlnroND7Bd2mebTbwl7fDteNeuAjfBEEPOOFWcBUFmGt3FtoqdVsh
         5a3NgA+tIEXi6hJ3zyhzkCzLle2/x36OXoMNU1FnYF6BWaVz/Qi9bdgTySKuiLSMjazx
         oAFw==
X-Gm-Message-State: AOAM533MambVotia/y5lstf9SuENTde7ihOhfwug2wuYlnfRKSOYTahF
        41yBGBSM0xqgRdZxIzvTas3kx40bSXyjbYI9wG+0Z2RU
X-Google-Smtp-Source: ABdhPJyf5w+qf7hNqN6HuvMXp6PRQgoByrWNKp8/aLiV+ydTtcAnz0b9KIx98j3oJcELOQmXHcIJ2xmOaNtEsH1hiLw=
X-Received: by 2002:a1f:1841:: with SMTP id 62mr33401186vky.26.1634135325347;
 Wed, 13 Oct 2021 07:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211012100038.375289-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20211012100038.375289-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Oct 2021 16:28:34 +0200
Message-ID: <CAMuHMdXO+Ne1JLw_VbjNmVDzMaanw20MRvMqxphxhBzk9=UcKA@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779a0: Add and connect all
 CSI-2, ISP and VIN nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Tue, Oct 12, 2021 at 12:00 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The V3U have 32 VIN, 4 CSI-2 and 4 ISP nodes that interact with each
> other for video capture. Add all nodes and record how they are
> interconnected.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v2
> - Add empty port@0 nodes to all CSI-2 nodes.

Thanks for the update!

> Hello Geert,
>
> The last binding document for the CSI-2 nodes are now merged in the
> media-tree and this completes the coverage for the nodes in this patch.
>
> I fixed the missing port@0 nodes for CSI-2 and actually ran make
> dtbs_check ontop of the media-tree instead of on v5.14-rc4 to include
> the CSI-2 binding update for V3U. Thanks for spotting that.
>
> If you are happy with the corrections I think this is ready to be
> consumed.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
