Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 781D07B0387
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Sep 2023 14:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbjI0MLW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Sep 2023 08:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbjI0MLV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2023 08:11:21 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C13BE;
        Wed, 27 Sep 2023 05:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=ZzMxUuept6VBAEnV/FrnHTnHdE0lCJajdN2vvTzAbp0=; b=l6sKsoreh4AGZrewPQUug1d+JK
        UfsMW3znZ11ViR4bEbf5bfUScQJYUol4x1vdVOcO3EI56rcqGAiQDwT7FlAHM1/6MYG/lqBfEL+fX
        0TQan8dawwfnMI+qxzMxEl0DM93i0WX4lbeOEFwXHWubBTBjdTjof9vvEEFCnNSSagYE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qlTNd-007deq-Tc; Wed, 27 Sep 2023 14:11:01 +0200
Date:   Wed, 27 Sep 2023 14:11:01 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH net] net: ethernet: renesas: rswitch Fix PHY station
 management clock setting
Message-ID: <0bae6059-37b8-427f-b108-86e2834bf334@lunn.ch>
References: <20230925003416.3863560-1-yoshihiro.shimoda.uh@renesas.com>
 <7156d89e-ef72-487f-b7ce-b08be461ec1c@lunn.ch>
 <TYBPR01MB534186322164085E74430B4BD8C3A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <496825ea-8d78-47b7-b4c7-f74874ca278c@lunn.ch>
 <TYBPR01MB53419F7AFFF80FAB49C4F92BD8C2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYBPR01MB53419F7AFFF80FAB49C4F92BD8C2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> Yes, the original version was tested on Spider board.
> The original version's MDC frequency was 25MHz.
> And the PHY (Marvell 88E2110) on Spider board can use such frequency,
> IIUC because the MDC period is 35 ns (so 28.57143MHz).

25MHz is way above anything i've tested.

> However, I don't know why this setting cannot work on the Starter Kit board
> because the board also has the same PHY. I guess that this is related to
> board design, especially voltage of I/O (Spider = 1.8V, Starter Kit = 3.3V).

I've had boards which will not work at 2.5Mhz until the pull up
resistor was changed to make the waveform compliant. So it probably is
related to the board.

> Anyway, changing the MDC frequency from 25MHz to 2.5MHz works correctly on
> both Spider and Starter Kit. So, I would like to apply the v3 patch [1] for safe.

O.K. That makes sense. If you want to support the higher speed, you
could implement the device tree property:


  clock-frequency:
    description:
      Desired MDIO bus clock frequency in Hz. Values greater than IEEE 802.3
      defined 2.5MHz should only be used when all devices on the bus support
      the given clock speed.

	Andrew
