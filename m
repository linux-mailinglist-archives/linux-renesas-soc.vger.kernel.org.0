Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB52728C35
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jun 2023 02:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237679AbjFIAJl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jun 2023 20:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237700AbjFIAJh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jun 2023 20:09:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1034A2D68;
        Thu,  8 Jun 2023 17:09:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 95E6E61A9C;
        Fri,  9 Jun 2023 00:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC781C4339B;
        Fri,  9 Jun 2023 00:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686269372;
        bh=7nzLJMNZ2AgOMNHbQ/B3K+7n/rvw29zxaly+m2sk1ao=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=G/4swEJI+GvsbcWwR3rghAwjZJnQE5SwXftzUolUeay/3fCiZuq0/f5tOmFsGh0Hv
         HdKhyDNq2KZ7ykG2X1mRVUipZPxuGstBDjxCJYtdzZSfSCI1lGyB6yGDPDr2Y7ZuQu
         kR73l3isWP43M3QTz0SkCf0W72ptQB/jNWonhgJAftnUGyP7TdhxUjRKvJzNtm8vX4
         biqSbqVJFr1eRdxoJoGVsPYipFA/ZAxJ6KkBZ9KRnezcyg7eGQ0UzctlkQZaDCsIY0
         QYa0DaDik8AjUKXxJR58fjaF6777XUtIPf+dqADgZ0PSI8YAvVx+326fUx9F7GllMq
         I6RSu+3s0de6w==
Message-ID: <4474a06189ec21462e234559af72dc53.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230514191959.706269-2-marek.vasut+renesas@mailbox.org>
References: <20230514191959.706269-1-marek.vasut+renesas@mailbox.org> <20230514191959.706269-2-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v2 2/2] clk: vc7: Use device_get_match_data() instead of of_device_get_match_data()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-renesas-soc@vger.kernel.org
To:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        linux-clk@vger.kernel.org
Date:   Thu, 08 Jun 2023 17:09:29 -0700
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

Quoting Marek Vasut (2023-05-14 12:19:59)
> Use device_get_match_data() which, unlike of_device_get_match_data(),
> is compatible with other firmware interfaces than just OF.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Applied to clk-next
