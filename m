Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFD687333B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jun 2023 16:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjFPOfT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Jun 2023 10:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345552AbjFPOfR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2023 10:35:17 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 065AA30E4;
        Fri, 16 Jun 2023 07:35:17 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-666e64e97e2so202468b3a.1;
        Fri, 16 Jun 2023 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686926116; x=1689518116;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVkLfJfg1IzPjJlvE2zHx9cuZH9kf1z6uYtdzh4+86w=;
        b=YSn8b1gNbaYL8aSa2k8wehsJAD+563gDfTB9VzUuRtKCeAWVEaq/bAbCeRsuVRDkWc
         99m3S62NXfR103lDx8Q2QWNsMF8nVavEuT+h7Iatuy+LNUPWVD/0UhLQV1Iqk3cQydlT
         6nBUuqs3wB8B/weWkr/0zqN9fZQY2DkRCxjk8HiTrN6PSgoGDb+GXkRDXpvv6NhywxoD
         S6efHiG4SPkkQly3odvDuBSVXRMfktwAZf7TUZIWfVMRwHEa6sdvUTBicYu7cEtKZGzX
         g4bKcy5zoTaKGXYTbOTBBLeKdDlxMdVP03ksw3IaCFe9ZayJGaPw40MM++dGh14nk0BK
         1lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926116; x=1689518116;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVkLfJfg1IzPjJlvE2zHx9cuZH9kf1z6uYtdzh4+86w=;
        b=V7sVQE3sMYgMh3NdZ+N/IcXEw05v8DdyundDtrM8Tx8e1+PG1fF4szgcfIOVzTLq/E
         hNeKiTl7xUXB1Phvf8sZaeQ0ziByqainCMkXurTDr+k+NPxXNJw9G1c9pq2LUPCXsXiZ
         GtcNTX1Tjifz88MIGcqEDuM7zV4kFHm7yekFTa+gzg3xbgxpXRDneUpZjBMQE009qRh2
         lbVC/UueV81RFXLYxVS76okjGiL11tcq/PUual4Iw18EuN86HnQFPHfgOCkrRGFJO3on
         oWLbbSU8JF16yJ650pb5GV21ub6nTyRcfvfGHaD8o8XPVNsUNjMNZ69k5dy1Y8wnj1cF
         RSaA==
X-Gm-Message-State: AC+VfDzAjPYeMUjIs84iKgkAgLGSITdxUq+KRhcYKIwUb4DvBGxuKSzL
        ZUwmGN9KqdWja21USY220Zhr7qvlh9+rxgXEHo4=
X-Google-Smtp-Source: ACHHUZ46MZaDoUiBWZdrX4LAuea4iCP6zUH1y2/Px+UPPO93FO57bJ+TgvjWgM1CNEixLYoGZ9o4V/6vZmmIna5ai1k=
X-Received: by 2002:a17:90a:94cc:b0:25e:8cf9:dee4 with SMTP id
 j12-20020a17090a94cc00b0025e8cf9dee4mr1659174pjw.45.1686926116251; Fri, 16
 Jun 2023 07:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230531070049.11806-1-wsa+renesas@sang-engineering.com>
 <CAHCN7xJxROk6RU66PjbGH4M-R7PbUG-4y_2BHyCeGx_hTeUprw@mail.gmail.com> <ZHeHx/rUE7ORf3V2@shikoro>
In-Reply-To: <ZHeHx/rUE7ORf3V2@shikoro>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 16 Jun 2023 09:35:04 -0500
Message-ID: <CAHCN7x+hVSC=uCtaQx0tLZ6UdkYvf8B0DGQJ52Xr8WjWU=jGpA@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] mmc: renesas_sdhi: add delay between tuning cmds
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Adam Ford <aford173@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 31, 2023 at 12:45=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > I am testing this on a 5.10 kernel based on the Renesas RZ linux
> > kernel branch.  The good news is that the card doesn't hang like it
> > used to on the older 4.19 kernel, but it still does not enumerate to
> > SDR104 speeds.
>
> U-Boot has a 1ms delay. Could you increase the delay to 1ms, please?

Sorry for the delay, but I increased this to  usleep_range(1000, 2500)
and it still hangs.

I don't know if the issue is dependent on the variant.  For what it's
worth, I am testing an RZ/G2M, but I can do the same thing on an
RZ/G2N or RZ/G2H if you want.

adam
>
