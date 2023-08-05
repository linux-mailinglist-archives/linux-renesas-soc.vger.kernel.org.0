Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0798770CD2
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Aug 2023 03:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjHEBCg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Aug 2023 21:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjHEBCg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Aug 2023 21:02:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B344EDD
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Aug 2023 18:02:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E175262175
        for <linux-renesas-soc@vger.kernel.org>; Sat,  5 Aug 2023 01:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D02C433C8;
        Sat,  5 Aug 2023 01:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691197354;
        bh=M+8sBjbD2p3XMgRE2SbAVr+Bgkba2GrE2IRQxa8Vhfw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DZEDe28rbiXMnMFtr+WtRHCOqLd7GonE2XTeocQ64SBl8ZCZ9Xrdn7fpK26ey8BG5
         DhsuxiBGjL1hPL0DB/gwBzOg44Wlzmo6Nw/Z/n0oJap00UFHCmVkNzPTAb4jOrUvJp
         YeUZ34Fcqy2KrsSHcs9hkI4GWnrD3OkuqjETdVDkpIcNZ+bAi7UtJz4jlEP1OLyiNd
         T1MwqpE049ZODhsIB0vYPJ/GAGA3d47W9Y5MFoTUfRox2gtXyiZxNZlanUXfuc+Iw/
         6CIHQMf4duu84ySnDwHfWWLOdkn51SkQKLte0W+J2NBjwfl2IKi2o4tx+GGJ23E5Az
         e0iuTYNpyezcw==
Date:   Fri, 4 Aug 2023 18:02:32 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        pabeni@redhat.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] net: renesas: rswitch: Add runtime speed
 change support
Message-ID: <20230804180232.68813359@kernel.org>
In-Reply-To: <20230803120621.1471440-2-yoshihiro.shimoda.uh@renesas.com>
References: <20230803120621.1471440-1-yoshihiro.shimoda.uh@renesas.com>
        <20230803120621.1471440-2-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu,  3 Aug 2023 21:06:20 +0900 Yoshihiro Shimoda wrote:
> +static const struct soc_device_attribute rswitch_soc_match[]  = {

nit: maybe a better than for this table would be good?
     To indicate what IDs it holds. E.g. rswitch_soc_no_speed_change[] ?

> +	{ .soc_id = "r8a779f0", .revision = "ES1.0" },
> +	{ /* Sentinel */ }
> +};
-- 
pw-bot: cr
