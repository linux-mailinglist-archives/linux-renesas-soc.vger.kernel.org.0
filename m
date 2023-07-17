Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A000875682E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 17:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjGQPk5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 11:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbjGQPk4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 11:40:56 -0400
X-Greylist: delayed 975 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 17 Jul 2023 08:40:54 PDT
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com (mailrelay4-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:403::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D950F136
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2023 08:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=IJcqcl6YEATV0uM7dxR1yHiimSywkAB+NQBBC5aE6+U=;
        b=InhAakGoJC6TOowEjtt+No6UauAzL4N3ZPqmJQe8HlxHNJBGJc3T+Z9IF8GCFjgWZ9AF7M8j2CVqW
         noKX6PAdSZrl5oCtQztP7hn0ti0TvO9+4j7j4GzhsZGfRhg4tATuESUV7Icdj5UNdSA+2Lr15V6HMo
         yjKkpKvB6+HCFsbSyRRKOatZyODe8Y8ajMemLzDoE6g/BVt7wKPdPn931q0mWlQCaL4HAZ9DmWE7i8
         QFIPB8MrIQKTCc/d56ISpEAnEB5R1EuHn16gUJ0wWcOcky8aZVkKKksd7+Vt/HqRICnaYSU3Q63/SG
         i2dGNSFziaQWEm3CaQI3mdb0Zsx5zrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=IJcqcl6YEATV0uM7dxR1yHiimSywkAB+NQBBC5aE6+U=;
        b=QUQREvwKt81IQjYRveEITn5JFi+JnH9YZ5vjRSweTgZl1GiUe37MMw22NG6k8mjxuTgW7n2YLqn31
         bGYSuQhCA==
X-HalOne-ID: 0480e098-24b6-11ee-94b9-592bb1efe9dc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay4 (Halon) with ESMTPSA
        id 0480e098-24b6-11ee-94b9-592bb1efe9dc;
        Mon, 17 Jul 2023 15:24:28 +0000 (UTC)
Date:   Mon, 17 Jul 2023 17:24:27 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH resend] drm/panel: simple: Simplify matching using
 of_device_get_match_data()
Message-ID: <20230717152427.GA559179@ravnborg.org>
References: <bca1d6f6a0582988accbb48d709aa9de7ad49ed7.1689600771.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bca1d6f6a0582988accbb48d709aa9de7ad49ed7.1689600771.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 17, 2023 at 03:34:13PM +0200, Geert Uytterhoeven wrote:
> Both the patform_driver and mipi_dsi_driver structures contain pointers
> to the match table used, so the custom code to obtain match and match
> data can be replaced by calls to of_device_get_match_data().
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Simpler - nice.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I expect someone else to pick it up.

	Sam
