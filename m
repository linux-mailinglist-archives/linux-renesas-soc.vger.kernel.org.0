Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13E977CDA47
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Oct 2023 13:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjJRL1H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Oct 2023 07:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbjJRL1H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2023 07:27:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36940112
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Oct 2023 04:27:06 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB87C433C7;
        Wed, 18 Oct 2023 11:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697628425;
        bh=VPd3dNhUEmZFXtITkpQzFS1TASvG6VdmVTe37B/we34=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l6yl07hGFV6tcoLemF7fp6G/GxLXkdJabzIWoKIHCQcvrZypQtSLhp6Pokuu6fHJE
         FTIl0ZnZPVivdgJNOYFdcpAeMaSdruX4fLSXX9n9akVg4lkjfJyE6BSUQD0Nl+K+wN
         pJCQB1Er98jfNLP5p7dTsAvgT1nLV1yE7HKh+YUlvo2ss7kO9h8F6AUdM+D9D1gvQs
         eu8fqjEDNkr072XRgFtOxnb3qCXtOGXIbVdw1hKqSCIErxFjm11OL6Cwvrp6jRlHti
         xEAzm/NoqbNxCKUUQHZ6A/2uJwaL+MhrjeIiEBlQ7UtZ30MLUVyrmlHj2Vte3spfgf
         1PrelXFzCl6cw==
Date:   Wed, 18 Oct 2023 13:26:58 +0200
From:   Simon Horman <horms@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/2] rswitch: Use unsigned int for port
 related array index
Message-ID: <20231018112658.GK1940501@kernel.org>
References: <20231017113402.849735-1-yoshihiro.shimoda.uh@renesas.com>
 <20231017113402.849735-2-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017113402.849735-2-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 17, 2023 at 08:34:01PM +0900, Yoshihiro Shimoda wrote:
> Array index should not be negative, so modify the condition of
> rswitch_for_each_enabled_port_continue_reverse() macro, and then
> use unsigned int instead.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms@kernel.org>

