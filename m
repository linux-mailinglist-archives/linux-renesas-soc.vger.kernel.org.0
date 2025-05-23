Return-Path: <linux-renesas-soc+bounces-17431-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D95AC21EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 13:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6E7B7BAA8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 11:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2671322B8B5;
	Fri, 23 May 2025 11:20:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5475422A4F0;
	Fri, 23 May 2025 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747999250; cv=none; b=rpfyIWXfHVWiQrF8JxF5Sxk5PAwgacj6Ld7KeWlc2QhD6ceNQp7Qn1P6nPdwFov628V/m7m42l6kUqDr2h2aIEZ33dTuNDD0DwSAY9rhqySvd4C89AaO4k0sKyCZfaVpNX5hNBWedwYKIEbNfxn5KDYzFd2KVDbSHD5JZC8O8Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747999250; c=relaxed/simple;
	bh=D5m9mjlqCvHyLg3xU/I4oNYkRM182PIux4X7sbU/rBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aafev/shQp0wH8ConsGAU7vD8objnhqOsNkY7miM4rHRS0hAAmMAFf1GYfotQKIefFoceK/EcbMQLop/PmC836pdIuIPpHd129VdCkxWJznU3VuoOMY3VRSjPDu04uQWQlmO4H3iBxJmmQfRGdWIrio7jtciFFaZy5NfzoJZLwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b3hmd3T2Mz9vXt;
	Fri, 23 May 2025 12:51:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6OGEq_bauYM; Fri, 23 May 2025 12:51:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b3hmd2TkFz9vXs;
	Fri, 23 May 2025 12:51:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4884C8B769;
	Fri, 23 May 2025 12:51:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id p6vSVHiM0Uvz; Fri, 23 May 2025 12:51:45 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 08E138B763;
	Fri, 23 May 2025 12:51:43 +0200 (CEST)
Message-ID: <8ad901c3-3fcb-4643-ac5a-c1f30f93d07f@csgroup.eu>
Date: Fri, 23 May 2025 12:51:43 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
To: Ai Chao <aichao@kylinos.cn>, perex@perex.cz, tiwai@suse.com,
 johannes@sipsolutions.net, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, broonie@kernel.org, jbrunet@baylibre.com,
 neil.armstrong@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
References: <20250522050300.519244-1-aichao@kylinos.cn>
 <20250522050300.519244-3-aichao@kylinos.cn>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250522050300.519244-3-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 22/05/2025 à 07:02, Ai Chao a écrit :
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.

I don't understand this explanation.

You say "no need to call of_node_put()" and the only thing you do in 
addition to changing from for_each_child_of_node() to 
for_each_child_of_node_scoped() is to _add_ a new call to of_node_put().

I would expect to see a _removal_ of some of_node_put() when I read your 
description.

Christophe

> 
> Thus, use this helper to simplify the code.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>   sound/aoa/soundbus/i2sbus/core.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
> index ce84288168e4..20a4c5891afc 100644
> --- a/sound/aoa/soundbus/i2sbus/core.c
> +++ b/sound/aoa/soundbus/i2sbus/core.c
> @@ -207,6 +207,8 @@ static int i2sbus_add_dev(struct macio_dev *macio,
>   			}
>   		}
>   	}
> +	of_node_put(sound);
> +
>   	/* for the time being, until we can handle non-layout-id
>   	 * things in some fabric, refuse to attach if there is no
>   	 * layout-id property or we haven't been forced to attach.
> @@ -335,7 +337,6 @@ static int i2sbus_add_dev(struct macio_dev *macio,
>   
>   static int i2sbus_probe(struct macio_dev* dev, const struct of_device_id *match)
>   {
> -	struct device_node *np;
>   	int got = 0, err;
>   	struct i2sbus_control *control = NULL;
>   
> @@ -347,7 +348,7 @@ static int i2sbus_probe(struct macio_dev* dev, const struct of_device_id *match)
>   		return -ENODEV;
>   	}
>   
> -	for_each_child_of_node(dev->ofdev.dev.of_node, np) {
> +	for_each_child_of_node_scoped(dev->ofdev.dev.of_node, np) {
>   		if (of_device_is_compatible(np, "i2sbus") ||
>   		    of_device_is_compatible(np, "i2s-modem")) {
>   			got += i2sbus_add_dev(dev, control, np);


