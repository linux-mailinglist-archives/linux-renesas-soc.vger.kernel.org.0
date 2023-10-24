Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE32F7D4E4C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Oct 2023 12:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjJXKyT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Oct 2023 06:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbjJXKyS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Oct 2023 06:54:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2510E5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Oct 2023 03:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698144811;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r6ob6RKRIAPi5Khx0xpjNiWs6euw8iDGvt/Bc/jthnM=;
        b=LseKrDJDeviJlhuurHo00cTFJQRmO+7iPJamiVPUz4UYkAuAJBxSlQU2yrVSck28SBy+wU
        Ot/EsutMtlgE5n1clX8OXT5oFp3peX1jwUrWwo72gzQ8B9E5z/fN3KPYLWdRa6REnyWrT4
        lHym4e2geEaPvgVik2DioVyCyfGTXnI=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-cQXH6F07NLySK92uS3WmiQ-1; Tue, 24 Oct 2023 06:53:30 -0400
X-MC-Unique: cQXH6F07NLySK92uS3WmiQ-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2c52242d7efso7552061fa.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Oct 2023 03:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698144809; x=1698749609;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r6ob6RKRIAPi5Khx0xpjNiWs6euw8iDGvt/Bc/jthnM=;
        b=irS3ZC3tByz3CWPERjB+uhR4SK0UtZAW0CjHxh3jdhYmO+8a2I/XMlvJhpIXypzG0L
         EppNy77Id/AKuEDF/aaaIhx+5ie9JJ+XPzjf29St1PfoMoSCwSF422L4N2Bjq0/dj1Eb
         aeDlNOLzNeqhQtpQrav4Yu17laAng35YU8YUZAnoNCnFFzDLcyBvLxD6Y4GlZO/QOYz8
         9SxOdtrAIKUV/Uv96sCqLSK1uA3NtwaA36qsJo6mijC2D+4WNGCzWvTeXMqVSH6rELFA
         ruiqAC5tbTXVGmgxKKYnUV2tyBH0eKPgamVIUm9MlgiYzyf4ZvzXNwrYograWQfWFnx6
         RALQ==
X-Gm-Message-State: AOJu0YxuSYLL2lWCtQMBkdJ1w1MJuL4Fn2e6EEFETJpDF9/m3tztNwwg
        peC9azBr0vriCYnBx3ZAMzN9RyuF/lQuXIfaj8xrOGfETy41kgi2WCzqT8tbpQKYEiODMtK7gl8
        m2HYFieue8B9d0cWadXkk170N/qQJPjsvm4Uvfnc=
X-Received: by 2002:a2e:9093:0:b0:2bf:e5dc:aa68 with SMTP id l19-20020a2e9093000000b002bfe5dcaa68mr8167974ljg.3.1698144808827;
        Tue, 24 Oct 2023 03:53:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6+UwT5yEGXNUvPuTwPIUcgM8GHlIrJ64DEgbjtALnH/OkHpdWanmLDXcDqMv2xU2rWv9gcg==
X-Received: by 2002:a2e:9093:0:b0:2bf:e5dc:aa68 with SMTP id l19-20020a2e9093000000b002bfe5dcaa68mr8167954ljg.3.1698144808405;
        Tue, 24 Oct 2023 03:53:28 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-242-180.dyn.eolo.it. [146.241.242.180])
        by smtp.gmail.com with ESMTPSA id y14-20020a170906070e00b00993664a9987sm8086424ejb.103.2023.10.24.03.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 03:53:27 -0700 (PDT)
Message-ID: <b0b4054adcb5250ad49e19d8f90c89de802f0125.camel@redhat.com>
Subject: Re: [PATCH net-next 2/2] net: ethernet: renesas: drop SoC names in
 Kconfig
From:   Paolo Abeni <pabeni@redhat.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Tue, 24 Oct 2023 12:53:26 +0200
In-Reply-To: <20231022205316.3209-3-wsa+renesas@sang-engineering.com>
References: <20231022205316.3209-1-wsa+renesas@sang-engineering.com>
         <20231022205316.3209-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 2023-10-22 at 22:53 +0200, Wolfram Sang wrote:
> Mentioning SoCs in Kconfig descriptions tends to get stale (e.g. RAVB is
> missing RZV2M) or imprecise (e.g. SH_ETH is not available on all
> R8A779x). Drop them instead of providing vague information. Improve the
> file description a tad while here.

It's not a big deal, but assuming that keeping the SoC list up2date
requires too much effort, I would still keep it, with some additional
wording specifying it's partial and potentially inaccurate.

Such list could be an useful starting point for an integrator looking
for the correct driver for his/her SoC.

Cheers,

Paolo

