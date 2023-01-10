Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B99026642EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 15:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233541AbjAJOO4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 09:14:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232799AbjAJOOy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 09:14:54 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E7F271E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 06:14:51 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id y1so13303862plb.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 06:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zui4crC73DoQm9XytkVgfQpnUH0Ss5EJyngLCW+80NU=;
        b=8Rpjr20m5J6hii51PkRbJEEdNTAi+YUfU2LFg0GiYWG1Gaw4Kp8oWUJ0Vbfy/zZqwP
         eQmyZ29Av4YB7DX+p5XXN31UcSQH3ZvrK0s0RqL0o085HApaiWrSBsd3mdNchZzdVssE
         jFbit1vlG5hA5PKb6cfKgt1/UBpwwkiqWkUnVTCH/2o7yahDOhVkHUrHdN22yKp39gvl
         91aiUf6O2hM2qAxAKjJgJT23urjs0fOWZ0frJgNn9p65alQY8lT5wpY3R6nM4yMfySIa
         7e+Q4bvQuGq3h2UFAJ0H/S8ZAZl5akc1NcRpCEIk77HjTrf8dKIYGKaLzpKaqose9RdA
         WDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zui4crC73DoQm9XytkVgfQpnUH0Ss5EJyngLCW+80NU=;
        b=2Z5Kgy8tlWlLyvxQheVQo1S4repZbWONwAKDZlaCfR/OQWW5U3PRQyxAOPnHobULWf
         1WKOrlRZ8HgpsZxy9bhUxZt2qrCOQ9hSGXKvRXfMmPTv1e+Nn7dXOC1nB8J7tr2qRo9P
         +UevPzOnpjmGVHrOqktsf1n4fC2WO8X/VY+jIhYdbcM5MGtZI02KyRrz1EdMxM2IP9d0
         O0bqqXErtqFSWyt9bnSTfdRrHn8KUbKXprOCzWdbTVoK3STv4J9K0k1Y2VCIfy0QoEdp
         nEspfpMBXRhKv21kt1bsx9TLzD08fwhr0kmga6AP8DDwbwk9A+2WXMI7ikyG1xpUjXaV
         bbFw==
X-Gm-Message-State: AFqh2kqS5nXyjkQMw3jqR8cBwG/sr6qIj+mhoMUy0JjjW49O3i23EYPQ
        EhHFfMtHDvWUnTfqK2dFcn0xBA==
X-Google-Smtp-Source: AMrXdXsELP4HXzQ4V6f4l2Y1/DWVeQjSxajwM+G9SiF0o/pt0g9NXQB4JQdizCtugmKZOEW1aPI6jw==
X-Received: by 2002:a17:902:bd8f:b0:193:2d46:7c5f with SMTP id q15-20020a170902bd8f00b001932d467c5fmr9191675pls.33.1673360090859;
        Tue, 10 Jan 2023 06:14:50 -0800 (PST)
Received: from localhost (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id e18-20020a170902ef5200b00187033cac81sm8211698plx.145.2023.01.10.06.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 06:14:49 -0800 (PST)
Date:   Tue, 10 Jan 2023 15:14:47 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: renesas: rswitch: Fix ethernet-ports
 handling
Message-ID: <Y71y1wKZMvi+qJ4h@nanopsycho>
References: <20230110095559.314429-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110095559.314429-1-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Tue, Jan 10, 2023 at 10:55:59AM CET, yoshihiro.shimoda.uh@renesas.com wrote:
>If one of ports in the ethernet-ports was disabled, this driver
>failed to probe all ports. So, fix it.
>
>Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
>Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
