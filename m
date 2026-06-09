Return-Path: <linux-renesas-soc+bounces-33778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t593BsdWKGq9CQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 20:09:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A82C766332F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 20:09:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=qaJnOM4x;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7000C3052C1E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 18:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0173A4963C9;
	Tue,  9 Jun 2026 18:08:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D107848A2DE;
	Tue,  9 Jun 2026 18:08:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781028509; cv=none; b=Aa5BxlpWTaCNvm4KAFluyhLG8p/bgTBfHiQ1+sNrYciICrT+Ioq/G0SLshBi95RFwdh0V6ZUV1j73JtYDiIRbr+ZHZGFZstdDa/y4XGZskgsKyu7Dy/NDikrss9O5AOKZmtvRzZr3VcOo2tmIYmlA9wiCLYmoSZaELAtXh+7xII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781028509; c=relaxed/simple;
	bh=bpY3QemIeCjx1P5g4wlHRCgNdtE4UdTtHtJcbUjHLv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwP/d+OcKo/5vmz8JwcEFk6agLTGXmEJmAsTEiC7qRzSjv4Fm7VdjWh6Wpwv8NpxdQc9E6wPCURABuTeMSbL7K8xKdm/d6HWxdjlULqP9CQ10HJeeM2aSGEAyLURBZpJA68by0/PP2RWFTtgWQfLwWKtwJBPuR7FKPTtnjXjFwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Igalia.com; spf=pass smtp.mailfrom=Igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=qaJnOM4x; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jmQG5WeeSfeQ4cMKQ+NS5lS+P+mvFzUDCDF4Y0YvZF4=; b=qaJnOM4xPbHRuRrA/5QhuyqXHT
	wioW2PB9MmIR2QLo77PGoDvfr+ictJoxPSLT/QZjD6bsNqfkL2bqt6rTL+dheMHsMnmoazrGhQ4Xq
	0o586vrmwRQCh0mF0oAkLmSOV6KsTsOCbjQJt5VPrjUvCjbyxbM1McFV6KW7qI01QHp45/Y77vs95
	cUoG4SX2evcoqrSl6MLoC+uEqVbU26jWNngzJ97UXJ3fmNKp2VhBtDBSJTbF8FKDs5HQXoagkG0D3
	qxRL6ws+ZNIZ3vTUpQlU9HI55lkDtsS9Wc2cJ0GUHRBdRWgzo0e5lldN5FQ3lJNQkaFv0YK/Xl4e9
	SM4geRnA==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91] helo=[192.168.1.133])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wX0rj-00F6Ah-JX; Tue, 09 Jun 2026 20:07:55 +0200
Message-ID: <23cc1a03-39a6-4cc3-86ca-0d7c914ee40d@Igalia.com>
Date: Tue, 9 Jun 2026 11:07:44 -0700
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] drm/amd/display: use
 drmm_writeback_connector_init()
To: Alex Hung <alex.hung@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
 <20260505-wb-drop-encoder-v5-2-42567b7c7af2@oss.qualcomm.com>
 <27db214f-b57b-45ab-8deb-da2aa8efb9d7@amd.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <27db214f-b57b-45ab-8deb-da2aa8efb9d7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33778-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alex.hung@amd.com,m:dmitry.baryshkov@oss.qualcomm.com,m:jani.nikula@linux.intel.com,m:suraj.kandpal@intel.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:christophe.jaillet@wanadoo.fr,m:jesszhan0024@gmail.com,m:louis.chauvet@bootlin.com,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.or
 g,m:freedreno@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,oss.qualcomm.com,linux.intel.com,intel.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com];
	FORGED_SENDER(0.00)[John.Harrison@Igalia.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[John.Harrison@Igalia.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,Igalia.com:mid,Igalia.com:from_mime,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A82C766332F

Ping @Dmitry - is there any progress with this patch set?

Thanks,
John.

On 5/26/26 11:46, Alex Hung wrote:
> Will allocating wbcon with drmm_kzalloc before calling 
> amdgpu_dm_wb_connector_init be more memory-safe as below?
>
>
> @@ -5790,7 +5791,8 @@ static int 
> amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
>          link = dc_get_link_at_index(dm->dc, i);
>
>          if (link->connector_signal == SIGNAL_TYPE_VIRTUAL) {
> -            struct amdgpu_dm_wb_connector *wbcon = kzalloc_obj(*wbcon);
> +            struct amdgpu_dm_wb_connector *wbcon =
> +                drmm_kzalloc(adev_to_drm(adev), sizeof(*wbcon), 
> GFP_KERNEL);
>
>              if (!wbcon) {
>                  drm_err(adev_to_drm(adev), "KMS: Failed to allocate 
> writeback connector\n");
> @@ -5799,7 +5801,6 @@ static int 
> amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
>
>              if (amdgpu_dm_wb_connector_init(dm, wbcon, i)) {
>                  drm_err(adev_to_drm(adev), "KMS: Failed to initialize 
> writeback connector\n");
> -                kfree(wbcon);
>                  continue;
>              }
>
> On 5/4/26 18:24, Dmitry Baryshkov wrote:
>> The driver uses drm_writeback_connector_init() instead of its drmm
>> counterpart, but it doesn't perform the job queue cleanup (neither
>> manually nor by calling drm_writeback_connector_cleanup()). On the
>> contrary, the drmm_writeback_connector_init() function ensures the
>> proper cleanup of the job queue.
>>
>> Use drmm_plain_encoder_alloc() to allocate simple encoder and
>> drmm_writeback_connector_init() in order to initialize writeback
>> connector instance.
>>
>> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  2 +-
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 18 
>> +++++++++++++-----
>>   2 files changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index e96a12ff2d31..2ac64495cdb7 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -10683,7 +10683,7 @@ static void dm_set_writeback(struct 
>> amdgpu_display_manager *dm,
>>           return;
>>       }
>>   -    acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
>> +    acrtc = to_amdgpu_crtc(crtc_state->base.crtc);
>>       if (!acrtc) {
>>           drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
>>           kfree(wb_info);
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
>> index 110f0173eee6..fdc3da40452f 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
>> @@ -169,7 +169,6 @@ static const struct drm_encoder_helper_funcs 
>> amdgpu_dm_wb_encoder_helper_funcs =
>>     static const struct drm_connector_funcs 
>> amdgpu_dm_wb_connector_funcs = {
>>       .fill_modes = drm_helper_probe_single_connector_modes,
>> -    .destroy = drm_connector_cleanup,
>>       .reset = amdgpu_dm_connector_funcs_reset,
>>       .atomic_duplicate_state = 
>> amdgpu_dm_connector_atomic_duplicate_state,
>>       .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> @@ -188,17 +187,26 @@ int amdgpu_dm_wb_connector_init(struct 
>> amdgpu_display_manager *dm,
>>       struct dc *dc = dm->dc;
>>       struct dc_link *link = dc_get_link_at_index(dc, link_index);
>>       int res = 0;
>> +    struct drm_encoder *encoder;
>> +
>> +    encoder = drmm_plain_encoder_alloc(&dm->adev->ddev, NULL,
>> +                       DRM_MODE_ENCODER_VIRTUAL, NULL);
>> +    if (IS_ERR(encoder))
>> +        return PTR_ERR(encoder);
>> +
>> +    drm_encoder_helper_add(encoder, 
>> &amdgpu_dm_wb_encoder_helper_funcs);
>> +
>> +    encoder->possible_crtcs = 
>> amdgpu_dm_get_encoder_crtc_mask(dm->adev);
>>         wbcon->link = link;
>>         drm_connector_helper_add(&wbcon->base.base, 
>> &amdgpu_dm_wb_conn_helper_funcs);
>>   -    res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
>> +    res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
>>                           &amdgpu_dm_wb_connector_funcs,
>> -                        &amdgpu_dm_wb_encoder_helper_funcs,
>> +                        encoder,
>>                           amdgpu_dm_wb_formats,
>> -                        ARRAY_SIZE(amdgpu_dm_wb_formats),
>> - amdgpu_dm_get_encoder_crtc_mask(dm->adev));
>> +                        ARRAY_SIZE(amdgpu_dm_wb_formats));
>>         if (res)
>>           return res;
>>
>


