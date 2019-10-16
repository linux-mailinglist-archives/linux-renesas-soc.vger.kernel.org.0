Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 066C0DA276
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2019 01:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388485AbfJPXu5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 19:50:57 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:25929 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728701AbfJPXu5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 19:50:57 -0400
Date:   17 Oct 2019 08:50:54 +0900
X-IronPort-AV: E=Sophos;i="5.67,305,1566831600"; 
   d="scan'208";a="29271370"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Oct 2019 08:50:54 +0900
Received: from morimoto-PC.renesas.com (unknown [10.166.18.140])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 067A44008C75;
        Thu, 17 Oct 2019 08:50:43 +0900 (JST)
Message-ID: <878spkuu5o.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Junya Monden <jmonden@jp.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Timo Wischer <twischer@de.adit-jv.com>,
        <stable@vger.kernel.org>
Subject: Re: [PATCH] ASoC: rsnd: Reinitialize bit clock inversion flag for every format setting
In-Reply-To: <20191016124255.7442-1-erosca@de.adit-jv.com>
References: <20191016124255.7442-1-erosca@de.adit-jv.com>
User-Agent: Wanderlust/2.15.9 Emacs/24.5 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi

> Unlike other format-related DAI parameters, rdai->bit_clk_inv flag
> is not properly re-initialized when setting format for new stream
> processing. The inversion, if requested, is then applied not to default,
> but to a previous value, which leads to SCKP bit in SSICR register being
> set incorrectly.
> Fix this by re-setting the flag to its initial value, determined by format.
> 
> Fixes: 1a7889ca8aba3 ("ASoC: rsnd: fixup SND_SOC_DAIFMT_xB_xF behavior")
> Cc: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> Cc: Jiada Wang <jiada_wang@mentor.com>
> Cc: Timo Wischer <twischer@de.adit-jv.com>
> Cc: stable@vger.kernel.org # v3.17+
> Signed-off-by: Junya Monden <jmonden@jp.adit-jv.com>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

