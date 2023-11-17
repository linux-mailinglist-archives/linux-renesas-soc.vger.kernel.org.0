Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC8737EF78F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Nov 2023 19:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjKQSvt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Nov 2023 13:51:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjKQSvs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2023 13:51:48 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C447C5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 10:51:44 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-507975d34e8so3294825e87.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 10:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700247102; x=1700851902; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQGatBI0OkqUrIpIX0xAokAM84axFAYGBfdfsPOdbwQ=;
        b=VzC+640Gqkmtp1CvnLYfrD4xzLHiZRN37M8ENthOc8Cu3tfu4wGytMNlPCvQWbeDLr
         50tnGzFS4JSlPRtHXFndqFp4PbFcYBdRMCWGguvO2y1C4V22hgfcZoB6OHtV5sS5DFRt
         Va8z/AIafXSFapEJBuXJAqmamNeZAb+eh1u2GqL4txgntIyqgsmsYxW6367ip1vxayw2
         gw3YiavtZrDroGKFMWHniN5mM7D8TjvRYY1SBTSo7rg5pSZDNMkM5WkQba04ADuS9nYV
         exRPMoqmWHXLW4KsEBcfhvEcweNV+KVgm/V+ew5rgqksAA7YMdElvS7qM6DHjV5hOl3E
         BrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700247102; x=1700851902;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQGatBI0OkqUrIpIX0xAokAM84axFAYGBfdfsPOdbwQ=;
        b=kthNi67Hpzdfqe1+WQAR6wCw2vhJhUp422PgrF4/f+P4X1aBv4Z7d88Pvf2A3739B6
         iYJJzNJ2ODE4Vy4UeikfzDQxQ0RkZsPQAfLtAKHKYOee/w1LCTP+DTUjaxKaOjc7pIOF
         ECCjfW+3YzYFyIrJ9Jq8kVMjHt3pjdlotgeS8xdupEOhbg3u+HsIIcjcXD8MX/wus2sH
         clW2ZzAYDqpJHrTLfE+/EynLlKDd23RmDvQKl+Wh4ykFF8bEuNsAI4wtJri8Q77gyZJj
         7NEa2qpjNmuErdfurd148l2TEPTsmLSd/UErF13wKe2NO7L3+otl6EABao252Abx1P/A
         kr3g==
X-Gm-Message-State: AOJu0YxtdXhUIkSJYq5CkTasgnjCt+rSbNf0u5OI5FMw1yu4dWbsG4nt
        F+SXd4Dax/9EqSMyMXhyG5PrNA==
X-Google-Smtp-Source: AGHT+IGYHEM4uNeVtCO/gTZ0ewg2WFggdTQ5QwKVNBQCQEAOYbFeawwn3Nrq6gMLZoEU7DRPDeB94A==
X-Received: by 2002:ac2:532f:0:b0:509:4d7a:ab05 with SMTP id f15-20020ac2532f000000b005094d7aab05mr324793lfh.11.1700247102044;
        Fri, 17 Nov 2023 10:51:42 -0800 (PST)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id 26-20020ac2483a000000b004ff973cb14esm308572lft.108.2023.11.17.10.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 10:51:41 -0800 (PST)
Date:   Fri, 17 Nov 2023 19:51:40 +0100
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Wolfram Sang <wsa@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 4/5] net: ethernet: renesas: rcar_gen4_ptp: Add V4H
 clock setting
Message-ID: <ZVe2PJVQVZgKSFuE@oden.dyn.berto.se>
References: <20231117164332.354443-1-niklas.soderlund+renesas@ragnatech.se>
 <20231117164332.354443-5-niklas.soderlund+renesas@ragnatech.se>
 <ZVeqSsfBEMsQ+8mP@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVeqSsfBEMsQ+8mP@shikoro>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your review.

On 2023-11-17 13:00:42 -0500, Wolfram Sang wrote:
> 
> > +#define RCAR_GEN4_PTP_CLOCK_V4H		PTPTIVC_INIT_200MHZ
> 
> Is this easier right now or could it be added together with the TSN
> driver?
> 

I could not make up my mind, I think ether is fine. I opted to put it in 
this series to group all gPTP changes in one series. If you think it's 
better moved to the upcoming TSN series I can move it there.

-- 
Kind Regards,
Niklas Söderlund
