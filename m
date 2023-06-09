Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDB6728C2C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jun 2023 02:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237522AbjFIAIq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jun 2023 20:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjFIAIp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jun 2023 20:08:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C42B2D68;
        Thu,  8 Jun 2023 17:08:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3A6E8619EB;
        Fri,  9 Jun 2023 00:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE7EC433D2;
        Fri,  9 Jun 2023 00:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686269323;
        bh=0g/cOg2pYmnLF+VPl6ht+xKwWBRF8A6H5Y8bNL1wgV4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nI+V67dolberNCc1tYfxCW0M+92U4McJwFFwioaSg/dmXz6yN/n3BHlnwnWuXD7Tw
         1N3dCvBWzCSLlFw8JEnmxRq208U71kzk2Qt/+rGJwR7T0fjWfavj495xSymkDdiX3v
         icMYet2GrhGTLbN2Ql4bjvK6pw2wEIuotpYYrWLIokrcWiTd1+NG9j4Wn4/rAHRFt/
         kvDZjEJjy9hiT/97MFnB8kVKnIigcn5Z9FYfzoRhof4wDnHfUoAor8QDDo0puLuF41
         B5EZBRB42BQLJ9Lv81xl5CKiFO0cwNpvqCLHxTwG4+KMP6nMNlsXCu4rBMqqYMV+iX
         SN257bEAOdCXw==
Message-ID: <7ff04fa5ccf8240be128eb1006631119.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230514191959.706269-1-marek.vasut+renesas@mailbox.org>
References: <20230514191959.706269-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v2 1/2] clk: vc5: Use device_get_match_data() instead of of_device_get_match_data()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-renesas-soc@vger.kernel.org
To:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        linux-clk@vger.kernel.org
Date:   Thu, 08 Jun 2023 17:08:41 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Marek Vasut (2023-05-14 12:19:58)
> Use device_get_match_data() which, unlike of_device_get_match_data(),
> is compatible with other firmware interfaces than just OF.
>=20
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Applied to clk-next
