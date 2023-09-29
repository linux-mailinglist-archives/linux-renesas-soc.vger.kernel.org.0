Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D45387B32C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Sep 2023 14:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233105AbjI2Mpd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Sep 2023 08:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232959AbjI2Mpd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2023 08:45:33 -0400
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7176B7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 05:45:31 -0700 (PDT)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3af65455e7cso1047101b6e.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 05:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695991531; x=1696596331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0H7qlD4JIp8F/K5pZahX+iWLsC6hE1McU9VJLyzKtdQ=;
        b=DUabWhAgo6083QFZd9yNYUEX6aG+Esj1Ar3o89+k0Tsb+F13U6qcyXvPAup6VSvqR5
         Yu/egIhHtt6yEcpydDo++ewnOpRUcJxxYOwWtsVRcJISGIq3vrKpcMJ4JoXJ9RrjLPWQ
         Gv1B20oKpPqfLL3Q2RRuX8vpOqNhbTUsyjf+4FkEy6fSWMQytkaO8rcvQxinN6JZLbVJ
         V6UA8jVzI/4QE5uRSHOznDkbQQFXTJSPSZMCUYMaxNb32gzFO5D+jBVZPje8phZ2NcWq
         wS0PpojFg6DE9dLYguIQETuSty6Kp5FbW2MQVt2wE1awSvjdGeEZDUbxztQeTZ8zTSN9
         2AGg==
X-Gm-Message-State: AOJu0Yxwt96DlRNYhDpsMnKaUcW+qMQdkBy0SumXB329JTWgETAol/Yk
        beMbOppI8gyFSRdNBhx/v1+DQh3ICfTjmQ==
X-Google-Smtp-Source: AGHT+IHQJfxclBHza2inVXMzCCa3Z9EPAad233t70onuJsIto3yFLloqAAtFMJidLYlzLC1VIF4KQw==
X-Received: by 2002:a05:6808:1815:b0:3ae:16b6:6346 with SMTP id bh21-20020a056808181500b003ae16b66346mr4978024oib.7.1695991530879;
        Fri, 29 Sep 2023 05:45:30 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id dp4-20020a056808424400b003a3860b375esm3233938oib.34.2023.09.29.05.45.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 05:45:30 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6c4e38483d2so5534589a34.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 05:45:30 -0700 (PDT)
X-Received: by 2002:a9d:69c3:0:b0:6c6:19a6:29bf with SMTP id
 v3-20020a9d69c3000000b006c619a629bfmr4225039oto.7.1695991530322; Fri, 29 Sep
 2023 05:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com> <87lectim7t.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lectim7t.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Sep 2023 14:45:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVR+dchDRY1wo2RbeXJNb5f_Hbs9oGi90AV_1_rJgT-5A@mail.gmail.com>
Message-ID: <CAMuHMdVR+dchDRY1wo2RbeXJNb5f_Hbs9oGi90AV_1_rJgT-5A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: Add Renesas R8A779F4 SoC support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 26, 2023 at 6:37 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> R8A779F4 is update version of R8A779F0.
> This patch adds its support, but is using r8a7799f0 dtsi internally.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.7.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
