Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 109877352F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jun 2023 12:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbjFSKk2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jun 2023 06:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232080AbjFSKkP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2023 06:40:15 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B98510C;
        Mon, 19 Jun 2023 03:40:01 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2553663f71eso1318353a91.3;
        Mon, 19 Jun 2023 03:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687171200; x=1689763200;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csWkZ+3rEO5iESfqoXX46lFqWTpd14+bhReleYuntBQ=;
        b=siEu+MpaxpXWr1xJ86DiNClLQdE/64Cdr2FvUh/oTf40G6vCor394HZX43AfZRexDz
         rbPAZTIeU+5C2Xd5wWZTdukicNkPDkR4YfVBjtSzW9KbfTo13wchy8uwmFuQ1UevQAh/
         Ml2MVxX/X2oNQtQV5W9uTbOQxNFjOBhpbmnoVmXujjLye3whs2En3WVO2dWnkjekbQcP
         IomT3Z5mrhf6XanWppDXPQ9qlRgHgHIruddIRUI9e1/8+Cge5MfFVSN+OUrH5xOxyQmx
         nWwk2NJNJ9tedp4LGPstbqvO1wvvisK9RMDI/wPytfpStJ9nB3GANh3hJSkUg2DXvQjq
         PmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687171200; x=1689763200;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csWkZ+3rEO5iESfqoXX46lFqWTpd14+bhReleYuntBQ=;
        b=FNLWH0RmyIFgzWsPuwZj8s+VWCE4mHt0Avgqm1oU9TYeESrcjicI+8vFaPLKSsA18t
         +7ovJPYU2pI/OdAJDSaU3BaP4zj1sE0gl2Rf+pFYrNay5yfsLyq5s1Vl4SNd0MBZJn+k
         MCQk+5qtCBqAFzmO1oTBDVV94/8nYZUIPbj+Hyyaus8PrzSDCZea3jJEKYWpmlCQRglD
         5NW4H3rtD+nht7GM9HlW7yTGoQAr74WgJlkEH6C4SjFb7IUNGgXkbjUS8d5qphF7wlGn
         tMci1WYxmIEwJlwzLOyesuboipsXhjz0g47UivSaJI9pjkLI71LbGeLFjXIors3qyNb1
         fH8g==
X-Gm-Message-State: AC+VfDwtOVEJ+l5vKINreCid/aXlDodb9M0nmHH2xlOIgXW4vrnl60UW
        cdcihyurQQ8uJfPOTW6qN7GnGJB4vs/hOr7yoJM=
X-Google-Smtp-Source: ACHHUZ4pAJdTUQRwhN2roVPqnDowxnWFZfOULnwajFjlTLiyM7RbSSnkqTEjVJfyUzD/MUZVI2YCriaa0r1TEShTY2E=
X-Received: by 2002:a17:90a:b895:b0:25e:8169:1b44 with SMTP id
 o21-20020a17090ab89500b0025e81691b44mr4717606pjr.15.1687171200341; Mon, 19
 Jun 2023 03:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230531070049.11806-1-wsa+renesas@sang-engineering.com>
 <CAHCN7xJxROk6RU66PjbGH4M-R7PbUG-4y_2BHyCeGx_hTeUprw@mail.gmail.com>
 <ZHeHx/rUE7ORf3V2@shikoro> <CAHCN7x+hVSC=uCtaQx0tLZ6UdkYvf8B0DGQJ52Xr8WjWU=jGpA@mail.gmail.com>
 <ZI/viJ52TttqFveH@ninjato>
In-Reply-To: <ZI/viJ52TttqFveH@ninjato>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 19 Jun 2023 05:39:48 -0500
Message-ID: <CAHCN7xL6Xskd_5qcgtWbVw42reP2Z4o7+KyTPD64=8AO_fCxvw@mail.gmail.com>
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

On Mon, Jun 19, 2023 at 1:02=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Adam,
>
> > > U-Boot has a 1ms delay. Could you increase the delay to 1ms, please?
> >
> > Sorry for the delay, but I increased this to  usleep_range(1000, 2500)
> > and it still hangs.
>
> Sigh, back to the drawing board... But still thanks for trying! I'll try
> to come up with something better after EOSS in Prague (will you be there
> by any chance?)

I really tried to go, but my employer declined this time.  I was going
to go on my own, butI didn't have enough personal time off available
to fly out there.

adam
>
> Happy hacking,
>
>    Wolfram
>
