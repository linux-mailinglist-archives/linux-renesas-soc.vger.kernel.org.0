Return-Path: <linux-renesas-soc+bounces-29846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGfELCtvu2nGjwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 04:36:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF302C590A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 04:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6ADB300F29C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 03:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485FA2D29C8;
	Thu, 19 Mar 2026 03:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPqRJWir"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B5F22A7F9;
	Thu, 19 Mar 2026 03:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773891365; cv=none; b=iaenxvCxYI3k/F2+WS7v8vnB1+2k2RKX7/bE5kfgNMJ7+dzZiLvAvi/TtM9e9ywpAN8DMvlg+Le0vKhTSwZtW0G6jp+MrYADaQY+7oDNyPo1PS0FMVkr4C/7JFI6YOgk/vFLm//q2qwuvOXC+zo/O7r40jm8+3yGm9fF0WwINYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773891365; c=relaxed/simple;
	bh=r57NhHm4EluC+IXDDG39Njq4BRK4thi8SBtEZpnVuzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfO7hZyVanlP78TdpNnE1n2oE1T2CcAyfAKWh7evrPN3r0d/RlEaXKRNXyKL/YaXtPY3GpeSsQBr9/nmZE7iprDnc8PdPfgMFjMrGiD0ovvR4vbt/g2D0J6AGT6MccxDNEXiEUUpGHUSlmC1X6vllM/HJCR8o6GWdJEndP6XPCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPqRJWir; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91CCC19425;
	Thu, 19 Mar 2026 03:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773891365;
	bh=r57NhHm4EluC+IXDDG39Njq4BRK4thi8SBtEZpnVuzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NPqRJWir3CmR8wRdLLvyzZGLtaW4owq4vYODqxC3JE6QX3G8RcN4AXqaHvdZc3lGf
	 8UxQgvEy+Ma27uIlX6Tw4UgDSYakMWBIwWi2DpFmLQMSRtqNd9wQXux2e2j6GoU7Cm
	 W5FE2rLnzk69vR1xzOy9PZuxxcqMsFHyM6OOmaJ1q768NpHT+Ny4VThbK+EAtJ42A1
	 15XgDx1Ac322ILqGBNRhTAsRXC9ky2v08A+PjceRouLSyobXOQRC6iwfwjtdJPm2IY
	 VVVlZoxQVfYrGLTGzSsTNcrd2ra1vBI64VK+nCV34fu6AcaIAdBAUj5uh/MP5OM+Le
	 yx60U1doedVMw==
Date: Wed, 18 Mar 2026 22:36:00 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Ilia Lin <ilia.lin@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] soc: qcom: pd-mapper: Convert to
 of_machine_get_match()
Message-ID: <abtvGIWzG-UxN1GD@baldur>
References: <cover.1772468323.git.geert+renesas@glider.be>
 <0d23a449e62ac85f04ff07bc2758efbaa709c9d1.1772468323.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d23a449e62ac85f04ff07bc2758efbaa709c9d1.1772468323.git.geert+renesas@glider.be>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29846-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.962];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AEF302C590A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 02, 2026 at 05:29:10PM +0100, Geert Uytterhoeven wrote:
> Use the of_machine_get_match() helper instead of open-coding the same
> operation.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> Compile-tested only.
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> index dc10bc859ff4170c..8a1a18f8c859496f 100644
> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> @@ -615,15 +615,9 @@ static struct qcom_pdm_data *qcom_pdm_start(void)
>  	const struct qcom_pdm_domain_data * const *domains;
>  	const struct of_device_id *match;
>  	struct qcom_pdm_data *data;
> -	struct device_node *root;
>  	int ret, i;
>  
> -	root = of_find_node_by_path("/");
> -	if (!root)
> -		return ERR_PTR(-ENODEV);
> -
> -	match = of_match_node(qcom_pdm_domains, root);
> -	of_node_put(root);
> +	match = of_machine_get_match(qcom_pdm_domains);
>  	if (!match) {
>  		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
>  		return ERR_PTR(-ENODEV);
> -- 
> 2.43.0
> 

