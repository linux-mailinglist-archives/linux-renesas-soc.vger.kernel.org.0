Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14D8A3BA500
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jul 2021 23:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbhGBVZq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jul 2021 17:25:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:49932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230157AbhGBVZp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jul 2021 17:25:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 594BB61402;
        Fri,  2 Jul 2021 21:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625260993;
        bh=yAhQFVf44jvVEKIgKmS7YsNEfX/ea54OOnmo6JElnSI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NX0DW4ndglFPz7ZC0wCE9ALh9NMbU4mvmVIItzA8+pKgOeUJpjpsOF0njK4EMlNuJ
         cV4blNdSHCh1cjDywGwpPoymNKv8iUVdwnERbdrbez9g/XjaF73vDIytIGS6R8IyKi
         0qHvZ5B8CaZU1M3cHVrLEbLmD9u53awwo0wzcXVLK5dR6dKvxFZw6C24a7QmOARj6Y
         9AixBOAoSQpIqa0w2h9Z5n3rfR+isUPSdKRH9VQ7jvnefXBkzfQjjAvRFjZBSB/oY/
         BL2NByQBPrlGaqMTYyAVqXtwuMhwsfD4OvShgDWYPROL+/CPYJTW6xKr23yMhvA1ru
         ghDS3oJAnBaYw==
Received: by mail-ej1-f51.google.com with SMTP id o5so18310828ejy.7;
        Fri, 02 Jul 2021 14:23:13 -0700 (PDT)
X-Gm-Message-State: AOAM532Fn23T03Er1pS2GguMsWRoGzOeyfjNmxeNvduQ0C0q9RYXXHUB
        v18IhKCTvbrFvj0YT19Xdm2MY7TIRJO0CTCV2Q==
X-Google-Smtp-Source: ABdhPJyL1BkaDJTaTIzttEw91SPz36BUktrJTaiBX9yCmMzBdceU6QMBM6nm3aeqLlVC4lmvvTW0iFZ3yjt4cFTBRJk=
X-Received: by 2002:a17:907:2cc7:: with SMTP id hg7mr1730302ejc.360.1625260991859;
 Fri, 02 Jul 2021 14:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210702135010.5937-1-biju.das.jz@bp.renesas.com> <20210702135010.5937-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210702135010.5937-2-biju.das.jz@bp.renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 2 Jul 2021 15:23:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKWzxVzrK+p3USL_nK28hf1JMq_P=zJmtCD2d+SufTzRA@mail.gmail.com>
Message-ID: <CAL_JsqKWzxVzrK+p3USL_nK28hf1JMq_P=zJmtCD2d+SufTzRA@mail.gmail.com>
Subject: Re: [PATCH 1/9] ASoC: dt-bindings: Document RZ/G2L bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 2, 2021 at 7:50 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Document RZ/G2L ASoC serial sound interface bindings.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Note:-  This patch has dependency on #include <dt-bindings/clock/r9a07g044-cpg.h> file which will be in
> next 5.14-rc1 release

That kind of means you should wait and send this once v5.14-rc1 is
released as it is the merge window currently.

Rob
