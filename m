Return-Path: <linux-renesas-soc+bounces-28753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MPbNQoQqGk8ngAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 11:57:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 323241FE9D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 11:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E42AC302411E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 10:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5318D3A451B;
	Wed,  4 Mar 2026 10:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TdQtjZ5X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4F73A1D10
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 10:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772621798; cv=pass; b=hq9D2GbwqSfbun/171UIv5AFxG7NtSE/GiO1xllJJ7knmTDODLS2y1UtDX5P2MDsDomUbPwxmNYUKsMfN/8yWnEuQ4N2QWhpESEVPkijtZz6hsEhB8uvmf4NpNh2qUMKpoud1mss42ymEsg/EqzXq6fJI1Q8azZHTws4RiwsvmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772621798; c=relaxed/simple;
	bh=gFAXJW6wqNB4bFP8Bd67zykCDJIItcLQlhgPjD2ytvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o89EOk68fYj/CZ8uRYcb7Q3xgw1Nt0rqaPmQoLi4i/o7zD5mQhruXUDqhNKFVuirdfwds5qXu9FFl0sDktAa9AbdjdzcP8KrTFS9DQ6Avu/zkuSxdRVn02g1eoZXEeXFCrOeFutlHQMRpf0ltFL/YGn9+ZVUfHHuWE+/hMJyvGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TdQtjZ5X; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a3066b68bso3144831fa.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 02:56:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772621795; cv=none;
        d=google.com; s=arc-20240605;
        b=Z5f5H4BTgb2+WNs6/CHHBSmn8NBhJSL3aXOofW3O8eyF75v4lmpFdABGvdNYTY3fiV
         6guEtvDQfslxgQC38uvTm3WpwlDM3v59fjFGDt5C9f4iCVEARf9VKHy7RPGOYWeZDPWw
         LbmJkhrzvmJOQktAVI2Wzz+WGn0StQZfSX6rhPUp4QVRQ8CmbxXHNdJzz4Vk5iqw92Yk
         pmttIx99WNifb5Qtll4L3Em0f47gOmJAirjfseUgiTFllqga9Mr5uSL9uGBOZvLoTOA1
         samtgDImT0ov3Vw1jR5gqvi+4GlxleANqQfQLSrZX6eOCjHwNEkwy2pfbcbHx6hoJ0Ff
         jUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Fo/8L1vqlOfM+seM66MGkBVDWRE/a0s5YAa4O57zdbc=;
        fh=8JHRunmW6gMOxlSLm5Zgt3j46o/dyVFCPxkKr/URpX4=;
        b=VqdlqsWVYj8PSpB73bF9UUbW6PTpwIEjecYGGdGJImLEJ2LokENfXfc/TRREs9a243
         HHNQV2qxZXflYkbWGYEXb+g5puEATv79axpSgGuT6k2+FCeoHX3XfcFgw3cq4fYmP328
         m88SUBAhwm/CzwRrodBNnvX276kI1catGBUUygIUX2nELnwTSSdwfaBiUpHwIb9Vkbp+
         +jjWUp23NLXzEFgFHkf2p0j2JJvIHKP70na7uIyXgL7L6oAcflUSUvFGQMe+E/pPOcao
         dalcJ8yAjnddRZdT6zfQqD/pZJcAdkyLBkFsEggrHYRBz522C4JQIgNdi8fozBtRS93G
         4D2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772621795; x=1773226595; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fo/8L1vqlOfM+seM66MGkBVDWRE/a0s5YAa4O57zdbc=;
        b=TdQtjZ5Xn9e1vshCgilzGsR8u1s7gp/1zt2uIc2EvSPyB7Tf8WlCryQnGJ7cDZVmmq
         BOPCX1yU2LgZCneCArCIJ5h6kL2b/KZXqrYZR7tSsBuDnEKcqDCbaihbghd1E7agjlnT
         BH69l91bxRpB8rJlx7I4ijQi3yOOQYHoqdSD23vkF9ch2wBqX0zt4sYfFPushWg0sN5P
         F8ujZ/l3Rzwugj+5DySqx+h0AF6fIMfPiq8VZ+9j6JgUfnAB4wzDP7O9MTvu+hiOcoqZ
         0M+4mDv16D7i9widoo/8/xQ6wuse4FVBdNX7G7/m+7jASWRqdUn+Tw+if0EiNgunYu8y
         60eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772621795; x=1773226595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fo/8L1vqlOfM+seM66MGkBVDWRE/a0s5YAa4O57zdbc=;
        b=Q9vwv0W4hTM7+PqYoG6R5iIdsob3K5+kwQLohtewVuRuKBvRDlQY1iSVZNq+M//sje
         SBbX+s48J1Vp++h4S68fOM4G65GxNobNo7ChFvolqVOtgv2lc6gCgyJOrWJbXSFYzLcM
         9Cf82dE1MUTc1xR1gDgL5DH38uOI7lnJP0bSQUNxmYSRbba8xzTMctKTuptOiTkaJvSW
         RuTmGLFmlEtuGNbspYWcA2lt7CJNKbWIAJpCxvzcfV620lSbHT1kVKKScIpjXNQcx+m6
         Wb85+5iB9xyQiiqTBW8s+tlSW5ggmtD/7M/pRfC5zIJyPhDa+YZwaOJMvm0wd8tgzuG2
         D2Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUgaB0/Sb+81ADZA+GtNgDec+ED05KvBtdsZcWvT8UEb+u/kjaCPe4hGGyH8tMBUmSxUeuYZuQTZEf7MUZTh1Frqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa4Pahxc0BtDXQMabt3twD8MCujrYXl20GMjFrVx5T9DSOMatn
	2t6YuifbcYpNtQq7fEVqsg4HsUXiY9QPgpwL0HhKupYeygV2jGtPTbrgpX1D6FQItsGwBS5+lPz
	xHSoSgPbXL/mT7x8pwM437iCBAyuVPpP2CllMSDlkZw==
X-Gm-Gg: ATEYQzyh9eYAf0MgUlvpBCi77z4xw2NrniltJD1FcHkCkJb16oRRPdzxBE8K09n4AVI
	dLjo0BpF3KHNBxKq4C0gyprDCf0Ire0mUDnVG5TKMr2cz+LfF//9Xt7lO06Dpe3GTqEutpywvDn
	w+z62cMaYn7UXM+0K23ZQzdY62bYnGOq7XvizaBoNfYkdjNDPV7MrqKyOcjHIwkqEW7zEABrrR/
	U+0Xv1/c9h9pfdawwGZzR9naM0JAlDPUgqdAtF2AWZoR3AzYKePi2H13cgjC3HniL1NbmxUwDjo
	+qQw8OK5
X-Received: by 2002:a05:651c:19a7:b0:38a:921:ddfa with SMTP id
 38308e7fff4ca-38a2c7bb11emr16394421fa.34.1772621794800; Wed, 04 Mar 2026
 02:56:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1cfa86b72b2a5aa2ade92f247dd318c9cb6ef2a1.1771267504.git.geert+renesas@glider.be>
In-Reply-To: <1cfa86b72b2a5aa2ade92f247dd318c9cb6ef2a1.1771267504.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Mar 2026 11:55:59 +0100
X-Gm-Features: AaiRm50xV0aTIf57r0Zo9-XIoeEBUsqVQ_XIKC2m6BAZ6n8Tqg5EToJh3NdooZ0
Message-ID: <CAPDyKFotV3bUEQic6X3PEC8m4fcXtc0JF0u7HTj9nRF1koowgA@mail.gmail.com>
Subject: Re: [PATCH/RFC] pmdomain: core: Support pd_ignore_unused with sync_state
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 323241FE9D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28753-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,glider.be:email,linaro.org:dkim]
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 at 19:47, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Since the introduction of the sync_state mechanism, the
> "pd_ignore_unused" kernel command line option doesn't really work
> anymore.  While genpd_power_off_unused() still checks for that flag
> before powering down unused domains, the new sync_state callbacks lack
> such checks, thus powering down unused domains regardless.
>
> Fix this by adding checks to the sync_state helpers and callbacks.
> Factor out the printing of the warning message, to make sure it is
> printed only once.
>
> Fixes: 002ebddd695a5399 ("pmdomain: core: Restore behaviour for disabling unused PM domains")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> RFC as I have no need for this in upstream.

I am trying to understand the use case and whether we should consider
to land this upstream.

Would you mind elaborating on how this is useful for you?

Kind regards
Uffe

> ---
>  drivers/pmdomain/core.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 7b563757935071dd..1f7d90bcc30d12e5 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -1366,6 +1366,16 @@ static int __init pd_ignore_unused_setup(char *__unused)
>  }
>  __setup("pd_ignore_unused", pd_ignore_unused_setup);
>
> +static bool genpd_ignore_unused(void)
> +{
> +       if (pd_ignore_unused) {
> +               pr_warn_once("genpd: Not disabling unused power domains\n");
> +               return true;
> +       }
> +
> +       return false;
> +}
> +
>  /**
>   * genpd_power_off_unused - Power off all PM domains with no devices in use.
>   */
> @@ -1373,10 +1383,8 @@ static int __init genpd_power_off_unused(void)
>  {
>         struct generic_pm_domain *genpd;
>
> -       if (pd_ignore_unused) {
> -               pr_warn("genpd: Not disabling unused power domains\n");
> +       if (genpd_ignore_unused())
>                 return 0;
> -       }
>
>         pr_info("genpd: Disabling unused power domains\n");
>         mutex_lock(&gpd_list_lock);
> @@ -3510,6 +3518,9 @@ void of_genpd_sync_state(struct device_node *np)
>  {
>         struct generic_pm_domain *genpd;
>
> +       if (genpd_ignore_unused())
> +               return;
> +
>         if (!np)
>                 return;
>
> @@ -3544,6 +3555,9 @@ static void genpd_provider_sync_state(struct device *dev)
>                 break;
>
>         case GENPD_SYNC_STATE_SIMPLE:
> +               if (genpd_ignore_unused())
> +                       return;
> +
>                 genpd_lock(genpd);
>                 genpd->stay_on = false;
>                 genpd_power_off(genpd, false, 0);
> --
> 2.43.0
>

