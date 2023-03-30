Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49B126D023A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Mar 2023 12:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbjC3K5B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Mar 2023 06:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbjC3K45 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2023 06:56:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00757DB3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 03:56:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1911061FEA
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 10:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6443CC433EF;
        Thu, 30 Mar 2023 10:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680173813;
        bh=Z/8TD4rvJoxGrQr8FdeA7TpbDXwOS00pvOOoPtw3JVE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OqDjKdbF8lHbkotvOpdQkWT7OHlUTNGt/iM1Xe/JGXgwRMaNXF2DleS759cYNlGkI
         PzYLf3+FAmM29xeIlVQ9ihSZKkO8WdROza40zKj/HFXNt4ovVspthIJlY1e/3Sep+u
         feojQeWdZ8Z00MFl7pq0pR7PgaGv0TouZTdwhgDSpS/Rjljxu1KrFSRlUcSqhmNgQL
         I/T+D9hDQL/gwPdyEy5AOY4hfq2BLHJHe932rlDxY/L6YBtmNx8HehzposN+BwStZW
         5+JsgXwj3KdqRCZgtDV3H1dIftfnXkAH1wjrZR/cU7gVy56KAHlXLklYxbWlEVIFOd
         VkkLXt5lTfDew==
Date:   Thu, 30 Mar 2023 11:56:48 +0100
From:   Lee Jones <lee@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        William Breathitt Gray <william.gray@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v14 2/6] mfd: Add Renesas RZ/G2L MTU3a core driver
Message-ID: <20230330105648.GX2673958@google.com>
References: <20230310170654.268047-1-biju.das.jz@bp.renesas.com>
 <20230310170654.268047-3-biju.das.jz@bp.renesas.com>
 <20230316155806.GN9667@google.com>
 <20230329205406.bfjftoto5jikalfh@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230329205406.bfjftoto5jikalfh@pengutronix.de>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 29 Mar 2023, Uwe Kleine-König wrote:

> Hello Lee,
>
> On Thu, Mar 16, 2023 at 03:58:06PM +0000, Lee Jones wrote:
> > On Fri, 10 Mar 2023, Biju Das wrote:
> > > [...]
> > I plan to take this set via MFD once you have  PWM Ack.
> >
> > For my own reference (apply this as-is to your sign-off block):
> >
> > Acked-for-MFD-by: Lee Jones <lee@kernel.org>
>
> Given that the pwm patch needs a rework, I wonder how to proceed here.
> Do you want to take patches 1 - 5 now? Or do you prefer to wait until
> the pwm patch is fine, too?

If I take them now, you won't be able to apply the PWM driver until next
cycle.

--
Lee Jones [李琼斯]
